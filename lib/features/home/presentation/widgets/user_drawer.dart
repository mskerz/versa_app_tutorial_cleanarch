import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/notification/presentation/providers/notification_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/user/user_model.dart';

class UserDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // รับค่าผู้ใช้จาก AuthStateNotifier
    final authState = ref.watch(authNotifierProvider);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: authState.when(
        initial: () => _buildGuestDrawer(
            context), // สำหรับสถานะ initial หรือยังไม่ได้ล็อกอิน
        loading: () => _buildLoadingDrawer(context), // สำหรับสถานะกำลังโหลด
        failure: (error) =>
            _buildGuestDrawer(context), // สำหรับกรณีเกิดข้อผิดพลาด
        success: (userResponse) => _buildUserDrawer(
            context, ref, userResponse?.user), // สำหรับสถานะสำเร็จ
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
  Widget _buildUserDrawer(BuildContext context, WidgetRef ref, User? user) {
    if (user == null) {
      return _buildGuestDrawer(context); // กรณีที่ user เป็น null
    }
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final notificationNotifier = ref.read(notificationStateProvider.notifier);
    return ListView(
    
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        // ข้อมูลผู้ใช้ที่แสดงบน Drawer
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: user.image.isNotEmpty
                        ? NetworkImage(user.image)
                        : AssetImage(DEFAULT_IMAGE_PROFILE) // ตรวจสอบ image
                    ),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: GoogleFonts.prompt(color: Theme.of(context).primaryColor, fontSize: 18),
                ),
                Text(
                  user.phoneNumber, // ตรวจสอบ email
                  style: GoogleFonts.prompt(color: Theme.of(context).primaryColor, fontSize: 18),
                ),
              ],
            ),
          ]),
        ),
        // เมนูต่างๆ ใน Drawer
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home',style: GoogleFonts.prompt(color: Theme.of(context).primaryColor)),
          onTap: () {
            // การนำทางไปหน้าหลัก
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings',style: GoogleFonts.prompt(color: Theme.of(context).primaryColor),),
          onTap: () {
            // การนำทางไปหน้าการตั้งค่า
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout',style: GoogleFonts.prompt(color: Theme.of(context).primaryColor)),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("ยืนยันการออกจากระบบ",
                      style: GoogleFonts.prompt(color: Theme.of(context).primaryColor)),
                  content: Text('คุณแน่ใจหรือไม่ว่าต้องการออกจากระบบ?',
                      style: GoogleFonts.prompt(color: Theme.of(context).primaryColor)),
                  actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer),
                      onPressed: () {
                        context.router.maybePop();
                      },
                      child: Text(
                        "กลับ",
                        style: GoogleFonts.prompt(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      onPressed: () async {
                        await authNotifier.signout(context);
                        context.router.pushAndPopUntil(HomeRoute(),
                            predicate: (_) => false);
                       },
                      child: Text(
                        "ออกจากระบบ",
                        style: GoogleFonts.prompt(color: Colors.white),
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
