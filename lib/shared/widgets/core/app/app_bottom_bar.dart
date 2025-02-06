import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/ui_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/icon/svg_icon.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final transionNavigator = ref.watch(transitionProvider);
    final transionNotifier = ref.watch(transitionProvider.notifier);

    int currentIndex = transionNavigator.index;
    final gradient = Theme.of(context).extension<GradientBackgroundExtention>()!;
    void _onTabTapped(int index) {
      transionNotifier.transitionTo(index);

      switch (index) {
        case 0:
          AutoRouter.of(context)
              .pushAndPopUntil(HomeRoute(), predicate: (_) => false);
          break;

        case 1:
          AutoRouter.of(context)
              .pushAndPopUntil(TokenRoute(), predicate: (_) => false);
          break;
        case 3:
          AutoRouter.of(context)
              .pushAndPopUntil(SubscriptionRoute(), predicate: (_) => false);
          break;
        case 4:
          AutoRouter.of(context)
              .pushAndPopUntil(SettingRoute(), predicate: (_) => false);
          break;
        default:
          break;
      }
      ref.read(transitionProvider.notifier).transitionTo(index);
    }

    Color? colorHandle(int index) {
      return currentIndex == index
          ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
          : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    }

    Widget buildBorderTop({double width = 0.0}) {
      return Positioned(
        top: 0,
        left: (MediaQuery.of(context).size.width / 5) * currentIndex +
            (MediaQuery.of(context).size.width / 12) -
            20, // Adjust the position based on the index
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 120),
          opacity: transionNavigator.isVisible ? 1.0 : 0.0, // Control opacity
          child: Container(
            width: 50, // Fixed width for the top border
            height: 3, // Border thickness
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: width,
                  color: Colors.transparent, // Remove default color
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [Color(0xFF1340E2), Color(0xFF911EBD)],
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            gradient: gradient.gradientBottomBar 
          ),
          child: BottomAppBar(
            notchMargin: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined,
                          color: colorHandle(0)),
                      Text('Home', style: GoogleFonts.poppins(fontSize: 12,color: colorHandle(0))),
                    ],
                  ),
                  onPressed: () => _onTabTapped(0),
                ),
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SVGIcons.coin(
                         colorHandle(1)
                      ),
                      Text('Token', style: GoogleFonts.poppins(fontSize: 12,color: colorHandle(1))),
                    ],
                  ),
                  onPressed: () => _onTabTapped(1),
                ),
                const SizedBox(width: 40), // Spacer for FAB
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentIndex == 3
                          ? FontAwesomeIcons.solidClock
                          : FontAwesomeIcons.clock
                          ,color: colorHandle(3),),
                      Text('Orders', style: GoogleFonts.poppins(fontSize: 12,color: colorHandle(3))),
                    ],
                  ),
                  onPressed: () => _onTabTapped(3),
                ),
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(currentIndex == 4
                          ? FontAwesomeIcons.userLarge
                          : FontAwesomeIcons.user,color: colorHandle(4)),
                      Text('More', style: GoogleFonts.poppins(fontSize: 12,color: colorHandle(4))),
                    ],
                  ),
                  onPressed: () => _onTabTapped(4),
                ),
              ],
            ),
          ),
        ),
        buildBorderTop(width: 15)
      ],
    );
  }
}
