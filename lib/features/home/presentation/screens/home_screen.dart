import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/leading_logo.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/notification/notification_icon.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/progress_signup.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/user_drawer.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ดึงค่า state จาก transitionProvider
    const double progress = 0.40;
    const double percent = progress * 100;
    final authState = ref.watch(authNotifierProvider);
// เช็คว่า user login แล้วหรือยัง
    final isLoggedIn = authState.maybeWhen(
      success: (userResponse) => userResponse?.isloggedIn ?? false,
      orElse: () => false,
    );

    final prefix = authState.maybeWhen(
      success: (userResponse) => userResponse?.user.gender == 'Male'
          ? 'Mr.'
          : userResponse?.user.gender == 'Female'
              ? 'Mrs.'
              : 'คุณ', // ใช้ Mx. สำหรับกรณีที่ไม่ต้องการระบุเพศ
      orElse: () => '',
    );
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150, // Set a fixed width for the leading widget
          leading: Builder(
            builder: (BuildContext context) {
              return LeadingLogo(
                logoAssetPath: DARK_LOGO_IMG,
                onMenuPressed: () {
                  // Open the drawer using the correct context
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            NotificationBadge(
              notificationCount: 1, // Example: 3 notifications
              onPressed: () {
                print("Notification Icon Pressed");
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Versa",
              //   style: TextStyle(
              //       fontFamily: AppTextStyles.fontFamily,
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold),
              // ),

              const SizedBox(
                height: 20,
              ),
              authState.maybeWhen(
                success: (userResponse) => Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Aligns text to start horizontally
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Aligns content at the top
                  children: [
                    Text(
                      "สวัสดี $prefix ${userResponse?.user.firstName} ${userResponse?.user.lastName}",
                      style: GoogleFonts.kanit(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5), // Adjust the space between texts
                    Text(
                      "Welcome to Versa ",
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                orElse: () => Container(),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isLoggedIn
                      ? Colors.white
                      : const Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(15, 0, 0, 0),
                    width: isLoggedIn ? 1 : 0,
                  ),
                ),
                child: isLoggedIn
                    ? buildLoggedInProgressBar(progress, percent)
                    : buildUnloggedInMessage(context),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //home
                  GestureDetector(
                    child: Material(
                      color: Colors.transparent, // ตั้งสีพื้นหลังเป็นโปร่งใส
                      child: InkWell(
                        onTap: () {
                          AutoRouter.of(context).pushAndPopUntil(TokenRoute(),
                              predicate: (_) => false);
                          ref.read(transitionProvider.notifier).transitionTo(1);
                        },
                        borderRadius:
                            BorderRadius.circular(20), // ให้ขอบกลมเหมือนกัน
                        splashColor: Colors.grey[200], // สีที่จะแสดงตอนคลิก
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF0D2B5B),
                              ),
                              child: Icon(Icons.widgets, color: Colors.white),
                            ),
                            Text(
                              "โทเคนดิจิทัล",
                              style: GoogleFonts.prompt(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // reservations
                  GestureDetector(
                    child: Material(
                      color: Colors.transparent, // ตั้งสีพื้นหลังเป็นโปร่งใส
                      child: InkWell(
                        onTap: () {
                          print("Reserve Token  tapped!");
                        },
                        borderRadius:
                            BorderRadius.circular(20), // ให้ขอบกลมเหมือนกัน
                        splashColor: Colors.grey[200], // สีที่จะแสดงตอนคลิก
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF0D2B5B),
                              ),
                              child: Icon(Icons.shopping_cart,
                                  color: Colors.white),
                            ),
                            Text(
                              "การจองซื้อ",
                              style: GoogleFonts.prompt(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // wallet
                  GestureDetector(
                    child: Material(
                      color: Colors.transparent, // ตั้งสีพื้นหลังเป็นโปร่งใส
                      child: InkWell(
                        onTap: () {
                          print("Reserve Token  tapped!");
                        },
                        borderRadius:
                            BorderRadius.circular(20), // ให้ขอบกลมเหมือนกัน
                        splashColor: Colors.grey[200], // สีที่จะแสดงตอนคลิก

                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF0D2B5B),
                              ),
                              child: Icon(Icons.wallet, color: Colors.white),
                            ),
                            Text(
                              "วอลเล็ท",
                              style: GoogleFonts.prompt(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20), // เพิ่มระยะห่างก่อนที่จะแสดงรายการที่เลื่อน
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
