import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';
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
    // ignore: constant_identifier_names
 
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Versa",
              style: TextStyle(
                  fontFamily: AppTextStyles.fontFamily,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "สวัสดี คุณจอห์น",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        '${percent.floor()}%',
                        style: TextStyle(fontSize: 10),
                      ),
                      CircularProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[200],
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "การสมัครของคุณยังไม่เสร็จสิ้น",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "กรุณาสมัครให้สำเร็จก่อนเริ่มลงทุน",
                        style: TextStyle(color: Colors.grey),
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
                        AutoRouter.of(context).pushAndPopUntil( TokenRoute(), predicate: (_)=>false);
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
                            "Token",
                            style: TextThemes.darkTextTheme.displaySmall,
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
                            child:
                                Icon(Icons.shopping_cart, color: Colors.white),
                          ),
                          Text(
                            "Subscription",
                            style: TextThemes.darkTextTheme.displaySmall,
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
                            "Wallet",
                            style: TextThemes.darkTextTheme.displaySmall,
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
      bottomNavigationBar: BottomNavBar()
    );
  }
}
