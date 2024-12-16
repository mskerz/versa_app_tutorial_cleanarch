import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/state/hover_notifier.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/text_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ดึงค่า state จาก transitionProvider
    const double progress = 0.3;
    const double percent = progress * 100;
    final isPressed = ref.watch(hoverProvider); // ติดตามสถานะของ hover

    // ignore: constant_identifier_names

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsApp.lightLogoPath),
                  Stack(
                    clipBehavior: Clip.none, // อนุญาตให้ Badge เกินขอบของ Icon
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.black),
                        onPressed: () {},
                      ),
                      // เพิ่ม Badge ที่มุมขวาบนของ Icon
                      Positioned(
                        right: 0, // ขยับ Badge ไปทางขวา
                        top: 0, // ขยับ Badge ไปด้านบน
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red, // สีพื้นหลังของ Badge
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 20, // ขนาดขั้นต่ำของ Badge
                            minHeight: 20,
                          ),
                          child: Center(
                            child: Text(
                              '3', // จำนวน Notification หรือค่าที่ต้องการแสดงใน Badge
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12, // ขนาดตัวอักษรของ Badge
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
              Text(
                "สวัสดี คุณจอห์น",
                style: GoogleFonts.kanit(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(15, 0, 0, 0),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '${percent.floor()}%',
                            style: TextStyle(fontSize: 10),
                          ),
                          Container(
                            child: CircularProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey[200],
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "การสมัครของคุณยังไม่เสร็จสิ้น",
                          style: GoogleFonts.prompt(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "กรุณาสมัครให้สำเร็จก่อนทำการ\nจองซื้อโทเคนดิจิทัล",
                          style: GoogleFonts.prompt(
                              color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
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
