import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/widget_bottombar/bottombar_clipper.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/icon/svg_icon.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final uiInstance = UIInstanceProvider(ref);
    final transionNavigator = uiInstance.transionNavigator;
    final transionNotifier = uiInstance.transionNotifier;
    final currentIndex = transionNavigator.index;
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

 

    Color? _getColorForTab(int index) {
      return currentIndex == index
          ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
          : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    }

    Widget _buildBorderTop({double width = 0.0}) {
      double itemWidth = MediaQuery.of(context).size.width / 5;

      return Positioned(
        top: 12,
        left: itemWidth * currentIndex + itemWidth / 2 - 25,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: transionNavigator.isVisible ? 1.0 : 0.0,
          child: Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: width, color: Colors.transparent),
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

    Widget _bottomNavItem({
      required Widget icon,
      required String label,
      required Color color,
      required VoidCallback onTap,
    }) {
      return IconButton(
        icon: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(label, style: GoogleFonts.poppins(fontSize: 12, color: color)),
            ],
          ),
        ),
        onPressed: onTap,
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipPath(
          clipper: BottomAppBarClipper(),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: gradient.gradientBottomBar),
          ),
        ),
        BottomAppBar(
          color: Colors.transparent,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          notchMargin: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavItem(
                icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined,
                    color: _getColorForTab(0)),
                label: "Home",
                color: _getColorForTab(0)!,
                onTap: () => _onTabTapped(0),
              ),
              _bottomNavItem(
                icon: SVGIcons.coin(_getColorForTab(1)),
                label: "Token",
                color: _getColorForTab(1)!,
                onTap: () => _onTabTapped(1),
              ),
              const SizedBox(width: 40), // Spacer for FAB
              _bottomNavItem(
                icon: Icon(
                  currentIndex == 3
                      ? FontAwesomeIcons.solidClock
                      : FontAwesomeIcons.clock,
                  color: _getColorForTab(3),
                ),
                label: "Orders",
                color: _getColorForTab(3)!,
                onTap: () => _onTabTapped(3),
              ),
              _bottomNavItem(
                icon: Icon(
                  currentIndex == 4
                      ? FontAwesomeIcons.userLarge
                      : FontAwesomeIcons.user,
                  color: _getColorForTab(4),
                ),
                label: "More",
                color: _getColorForTab(4)!,
                onTap: () => _onTabTapped(4),
              ),
            ],
          ),
        ),
        _buildBorderTop(width: 20),
      ],
    );
  }
}
