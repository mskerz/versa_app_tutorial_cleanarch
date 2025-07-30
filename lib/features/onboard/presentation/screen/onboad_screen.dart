import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:versa_app_tutorial_cleanarch/features/onboard/presentation/providers/onboarding_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/logo/versa.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class InvestorOnboardScreen extends ConsumerStatefulWidget {
  const InvestorOnboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<InvestorOnboardScreen> createState() =>
      _InvestorOnboardScreenState();
}

class _InvestorOnboardScreenState extends ConsumerState<InvestorOnboardScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = UIInstanceProvider(ref);
    final onboardIndex =
        ref.watch(onboardProvider); // ใช้ onboardProvider เพื่อรับค่า index
    final notifier = ref.read(onboardProvider.notifier);

    List<Widget> onboardingImages = [
     
      Image.asset(
        ONBOARDING_FIRST,
        fit: BoxFit.cover,
      ),
      Image.asset(
        ONBOARDING_SECOND,
        fit: BoxFit.cover ,
      ),
      Image.asset(
        ONBOARDING_THIRD,
        fit: BoxFit.cover,
      ),
       Image.asset(
        ONBOARDING_FOURTH,
        fit: BoxFit.cover,
      ),
    ];

    List<dynamic> onboardingContent = [
      {
        'title': 'Become Investor',
        'subtitle':
            'Invest in your future, build wealth, and create opportunities.',
      },
      {
        'title': 'Start your journey',
        'subtitle':
            'Discover the tools you need to manage your investments and grow your portfolio.',
      },
      {
        'title': 'Grow with confidence',
        'subtitle':
            'With the right strategy, your financial goals are within reach. Let’s make them happen together.',
      },
      {
        'title': 'Secure Your Future',
        'subtitle':
            'Build long-term financial security with smart investment strategies.'
      }
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background gradient
          Stack(
            children: [
              // รูปภาพพื้นหลัง
              Positioned.fill(
                child: onboardingImages[
                    onboardIndex], // ใช้ภาพตาม index ของ onboard
              ),

              // Container ทับซ้อนกับรูปภาพ
              Positioned.fill(
                child: Container(
                    width: 375,
                    height: 393,
                    margin: const EdgeInsets.only(top: 419),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.06, 0.1161, 0.2615, 0.3804],
                        colors: const [
                          Color(0x00121212), // rgba(18, 18, 18, 0)
                          Color(0x66121212), // rgba(18, 18, 18, 0.4)
                          Color(0xE6121212), // rgba(18, 18, 18, 0.9)
                          Color(0xFF121212), // #121212
                        ],
                      ),
                    )),
              ),
            ],
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  imageVersaLogo(ui.themeMode, width: 97, height: 50),
                  const SizedBox(height: 24),

                  // PageView for content
                  SizedBox(
                    height: 150, // Increase the height for image and text
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onboardingContent.length,
                      onPageChanged: (index) {
                        notifier.setIndex(index);
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Main text
                            Text(
                              onboardingContent[index]['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // Subtitle
                            Text(
                              onboardingContent[index]['subtitle'],
                              style: TextStyle(
                                color: Colors.white.withAlpha(178),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Smooth page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (onboardIndex < 3)
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onboardingContent.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: const Color(0xFF7C71E1),
                            dotColor: Colors.grey.withAlpha(77),
                            dotHeight: 4,
                            dotWidth:   10,
                            radius: 4,
              
                            expansionFactor: 2,
                          ),
                        ),

                      Container(
                        width: onboardIndex == 3 ? 130 : 56,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.0433,
                              1.1256,
                            ], // Approximate stops based on the given percentages
                            colors: [
                              Color(0xFF2F5CFF),
                              Color(0xFF8D1BBC).withAlpha(247),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors
                                  .transparent, // Remove shadow for more clean look
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            onPressed: () {
                              if (onboardIndex < 3) {
                                notifier.goToNextPage(); // ไปหน้าถัดไป
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve:
                                      Curves.easeIn, // ทำให้การเปลี่ยนเนียนขึ้น
                                );
                              } else {
                                // เมื่อถึงหน้าสุดท้ายให้ทำการ route ไปยังหน้าอื่น
                                context.router.pushAndPopUntil(HomeRoute(),
                                    predicate: (_) => false);
                              }
                            },
                            child: onboardIndex ==3
                                ? Text(
                                    "Get Started",
                                    style: GoogleFonts.poppins(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : Icon(
                                    FontAwesomeIcons.arrowRight,
                                    color: Theme.of(context).primaryColor,
                                    size: 24,
                                  )),
                      )

                      // Next button
                    ],
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
