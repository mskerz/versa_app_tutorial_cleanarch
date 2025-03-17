import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/token_build.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_containers.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/carousel_slider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ดึงค่า state จาก transitionProvider
    final auth = AuthProviderInstance(ref);
    final token = TokenInstanceProvider(ref);
    final button = TokenInstanceProvider(ref);
    final animate = UIInstanceProvider(ref);

    final theme = ref.watch(appThemeProvider);

    final selectedColor = theme == ThemeMode.dark
        ? Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({})
        : Colors.white;
    final unselectedColor = Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.surfaceTintColor
        ?.resolve({});

    final gredient =
        Theme.of(context).extension<GradientBackgroundExtention>()!;

    Widget buildButton(String label, int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
 padding: EdgeInsets.all(10),
              backgroundColor: button.selectedButtonIndex == index
                  ? selectedColor
                  : unselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // ความโค้งของขอบ
                side: BorderSide(
                    color: button.selectedButtonIndex == index
                        ? Colors.white
                        : Color(0x4DFFFFFF),
                    width: button.selectedButtonIndex == index
                        ? 1
                        : 0.8), // ขอบของปุ่ม
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

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 40,right: 40, bottom: 10),
            child: UserContainerState(
              instance: auth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ContentCarouselSlider(
            gradientColor: gredient.gradientContainerPrimary,
          ),

          const SizedBox(
            height: 10,
          ),

          //  user  state component  [user or guest]

          // Add SingleChildScrollView around the token section
          Container(
            // C1
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    "Token",
                    style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        
                        child: Row(
                          children: [
                            buildButton("All", 0),
                            buildButton("Ongoing", 1),
                            buildButton("Upcoming", 2),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(1),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // ความโค้งของขอบ
                            ),
                          ),
                          onPressed: () {
                            context.router.push(TokenRoute());
                            animate.transionNotifier.transitionTo(1);
                          },
                          child: Text(
                            "More",
                            style: GoogleFonts.poppins(fontSize: 10,color: Theme.of(context).scaffoldBackgroundColor),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: buildTokenPreview(
                  context, token.tokenData, button.selectedButtonIndex),
            ),
          ),

          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Theme.of(context).primaryColor
          //   ),
          //     onPressed: () {},
          //     child: Text(
          //       "See more...",
          //       style: GoogleFonts.poppins(color: Colors.white),
          //     ))
        ],
      ),
    );
  }
}
