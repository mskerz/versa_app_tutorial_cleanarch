
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

class UserDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // รับค่าผู้ใช้จาก AuthStateNotifier
    final authState = ref.watch(authNotifierProvider);

    return Drawer(
      backgroundColor: Colors.white,
      child: authState.when(
        initial: () => _buildGuestDrawer(context), // สำหรับสถานะ initial หรือยังไม่ได้ล็อกอิน
        loading: () => _buildLoadingDrawer(context), // สำหรับสถานะกำลังโหลด
        failure: (error) => _buildGuestDrawer(context), // สำหรับกรณีเกิดข้อผิดพลาด
        success: (userResponse) => _buildUserDrawer(context, ref,userResponse?.user), // สำหรับสถานะสำเร็จ
      ),
    );
  }

  // เมนู Drawer สำหรับผู้ใช้งานที่ยังไม่ได้ล็อกอินหรือเกิดข้อผิดพลาด
  Widget _buildGuestDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Center(
            child: Text(
              "Welcome , Guest!",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('Login'),
          onTap: () {
            // นำทางไปหน้าล็อกอิน
          },
        ),
      ],
    );
  }

  // เมนู Drawer สำหรับผู้ใช้งานที่ล็อกอินแล้ว
  Widget _buildUserDrawer(BuildContext context,WidgetRef ref,User? user) {
    if (user == null) {
      return _buildGuestDrawer(context); // กรณีที่ user เป็น null
    }
    
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        // ข้อมูลผู้ใช้ที่แสดงบน Drawer
        DrawerHeader(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: user.image.isNotEmpty?NetworkImage(user.image):AssetImage(DEFAULT_IMAGE_PROFILE) // ตรวจสอบ image
                ),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                ),
                Text(
                  user.phoneNumber, // ตรวจสอบ email
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
       ] ),
        ),
        // เมนูต่างๆ ใน Drawer
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // การนำทางไปหน้าหลัก
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // การนำทางไปหน้าการตั้งค่า
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Confirm Logout"),
                  content: Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                       onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel",style: GoogleFonts.prompt(color:Colors.black ),),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.back();
                     
                      },
                      child: Text(
                        "ออกจากระบบ",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  // เมนู Drawer เมื่อกำลังโหลด
  Widget _buildLoadingDrawer(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Center(
            child: CircularProgressIndicator(), // แสดงตัวหมุนกำลังโหลด
          ),
        ),
      ],
    );
  }
}
