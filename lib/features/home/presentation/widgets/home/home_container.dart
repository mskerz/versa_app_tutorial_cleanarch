import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token_build.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/ui_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/progress_signup.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_skeleton.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme_extension.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ดึงค่า state จาก transitionProvider
    const double progress = 0.40;
    const double percent = progress * 100;
    final auth =  AuthProviderInstance(ref);
    final token = TokenInstanceProvider(ref);
    final button = TokenInstanceProvider(ref);
    final theme = ref.watch(appThemeProvider);

    final selectedColor = theme == ThemeMode.dark ? Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.backgroundColor
        ?.resolve({}):Colors.white;
    final unselectedColor = Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.surfaceTintColor
        ?.resolve({});

    final gredient =
        Theme.of(context).extension<GradientBackgroundExtention>()!;

   


    Widget buildButton(String label, int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: button.selectedButtonIndex == index
                  ? selectedColor
                  : unselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // ความโค้งของขอบ
                side: BorderSide(
                    color: button.selectedButtonIndex == index
                        ? Colors.white
                        : Color(0x4DFFFFFF),
                    width:
                        button.selectedButtonIndex == index ? 1 : 0.8), // ขอบของปุ่ม
              ),
            ),
            onPressed: () {
              button.buttonNotifier.selectButton(index);
            },
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 10),
            )),
      );
    }

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

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            auth.authState.when(
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
            auth.authState.when(
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
                  child: buildUnloggedInMessage(context)), // กรณีโหลดข้อมูลอยู่
              loading: () => shimmerProgressBar(
                  context), // กรณีโหลดข้อมูลระหว่างการเข้าสู่ระบบ
              success: (_) => Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer.withAlpha(40),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(15, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                  child: buildLoggedInProgressBar(progress, percent, context)),
              failure: (error) => Center(
                child: Text(
                  "เกิดข้อผิดพลาด: $error",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),

            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,),
                  child: Text(
                    "Token",
                    style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(top: 5,),
                  child: Row(
                    children: [
                      buildButton("All", 0),
                      buildButton("Ongoing", 1),
                      buildButton("Upcoming", 2)
                    ],
                  ),
                ),
              
              ],
            ),

              Expanded(
                  flex: 1,
                  child: buildCardTokenLimited(context, token.tokenData, button.selectedButtonIndex)
                ),
          ],
          
        ),
      ),
    );
  }
}
