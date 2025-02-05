

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/progress_signup.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/user_skeleton.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme_extension.dart';

class MainContainer extends ConsumerWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     // ดึงค่า state จาก transitionProvider
    const double progress = 0.40;
    const double percent = progress * 100;
    final authState = ref.watch(authNotifierProvider);
// เช็คว่า user login แล้วหรือยัง
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final isInitial = ref.watch(isInitialProvider);
    final user = ref.watch(userProvider);

    String get_prefix(String gender) {
      switch (gender) {
        case "Male":
          return "Mr.";
        case "Female":
          return "Mrs.";
        default:
          return "คุณ";
      }
    }

    List<String> bannerContent = [
      'ICO Portal คืออะไร? \nทำความรู้จักกับ ICO',
      'Digital Token คืออะไร? \nเริ่มต้นกับเหรียญดิจิทัล',
      'วิธีการเลือกกระเป๋าเงินดิจิทัล (Digital Wallet)',
      'ทำไมการลงทุนใน ICO จึงสำคัญในยุคนี้?',
      'เข้าใจเทคโนโลยี Blockchain และการใช้งานใน ICO'
    ];
        final gradient = Theme.of(context).extension<GradientBackgroundExtention>();

    return 
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                authState.when(
                  initial: () => SizedBox.shrink(), // กรณีโหลดข้อมูลอยู่
                  loading: () => shimmerLabelLoading(
                      context), // กรณีโหลดข้อมูลระหว่างการเข้าสู่ระบบ
                  success: (userResponse) => userResponse != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "สวัสดี ${get_prefix(userResponse.user.gender)} ${userResponse.user.firstName} ${userResponse.user.lastName}",
                              style: GoogleFonts.kanit(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        )
                      : SizedBox.shrink(),
                  failure: (exception) => Container(), // กรณีที่ไม่สำเร็จ
                ), // กรณีที่ยังไม่ได้ล็อกอิน
                // ถ้าไม่ได้ล็อกอินจะไม่แสดงอะไร
                authState.when(
                  initial: () => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(15, 0, 0, 0),
                          width: 0,
                        ),
                      ),
                      child: buildUnloggedInMessage(
                          context)), // กรณีโหลดข้อมูลอยู่
                  loading: () => shimmerProgressBar(
                      context), // กรณีโหลดข้อมูลระหว่างการเข้าสู่ระบบ
                  success: (_) => Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(15, 0, 0, 0),
                          width: 1,
                        ),
                      ),
                      child:
                          buildLoggedInProgressBar(progress, percent, context)),
                  failure: (error) => Center(
                    child: Text(
                      "เกิดข้อผิดพลาด: $error",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
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
                            ref
                                .read(transitionProvider.notifier)
                                .transitionTo(1);
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
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Icon(Icons.widgets,
                                    color: Theme.of(context)
                                        .primaryIconTheme
                                        .color),
                              ),
                              Text(
                                "โทเคนดิจิทัล",
                                style: GoogleFonts.prompt(
                                    color: Theme.of(context).primaryColor),
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
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Icon(Icons.shopping_cart,
                                    color: Theme.of(context)
                                        .primaryIconTheme
                                        .color),
                              ),
                              Text(
                                "การจองซื้อ",
                                style: GoogleFonts.prompt(
                                    color: Theme.of(context).primaryColor),
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
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Icon(Icons.wallet,
                                    color: Theme.of(context)
                                        .primaryIconTheme
                                        .color),
                              ),
                              Text(
                                "วอลเล็ท",
                                style: GoogleFonts.prompt(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
             
                 Container(
                  child: Expanded(
                    child: ListView.builder(
                    
                      shrinkWrap: true, // ปรับขนาดตามเนื้อหา
                      scrollDirection: Axis.vertical, // เลื่อนแนวตั้ง
                      itemCount: bannerContent.length, // จำนวนแบนเนอร์ที่แสดง
                      itemBuilder: (context, index) {
                        String content =
                            bannerContent[index]; // รับเนื้อหาจาก bannerContent

                        return GestureDetector(
                          onTap: () {
                            // เมื่อคลิกแบนเนอร์ จะพิมพ์ข้อความ
                            print('คุณได้เลือก: $content');
                          },
                          child: Container(
                            width: double.infinity, // กำหนดความกว้างเต็มหน้าจอ
                            height: 140, // ความสูงของแบนเนอร์
                            margin: EdgeInsets.only(
                                bottom: 10), // ระยะห่างระหว่างแบนเนอร์
                            decoration: BoxDecoration(
                              // การตกแต่งแบนเนอร์
                              gradient: index % 2 == 0
                                  ? gradient?.gradientContainerPrimary
                                  : gradient
                                      ?.gradientContainerSecondary, // เปลี่ยนสีตาม index
                              borderRadius: BorderRadius.circular(8), // มุมโค้งมน
                            ),
                            child: Center(
                              child: Text(
                                content, // ข้อความของแบนเนอร์
                                style: GoogleFonts.kanit(
                                    color: index % 2 == 0
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .appBarTheme
                                            .backgroundColor,
                                    fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
     
  }
}