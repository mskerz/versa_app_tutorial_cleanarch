import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/icon/svg_icon.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override

  Widget build(BuildContext context, ref) {
    final transionNavigator = ref.watch(transitionProvider);
    int currentIndex = transionNavigator.index;
    Icon _getIcon(
        {required int index,
        required IconData selectedIcon,
        required IconData unselectedIcon}) {
      return Icon(
        transionNavigator.index == index ? selectedIcon : unselectedIcon,
      );
    }
       Widget _getIconSVG(
        {required int index,
        required Widget selectedIcon,
        required Widget unselectedIcon}) {
      return  
        transionNavigator.index == index ? selectedIcon : unselectedIcon;
      
    }

    // Update the navigation behavior when the tab is tapped
    void _onTabTapped(int index) {
      switch (index) {
        case 0:
          AutoRouter.of(context)
              .pushAndPopUntil(HomeRoute(), predicate: (_) => false);
          break;
        case 1:
          AutoRouter.of(context)
              .pushAndPopUntil(TokenRoute(), predicate: (_) => false);
          break;
        case 2:
          AutoRouter.of(context)
              .pushAndPopUntil(TokenWalletRoute(), predicate: (_) => false);
          break;
        case 3:
          AutoRouter.of(context)
              .pushAndPopUntil(SubscriptionRoute(), predicate: (_) => false);
          break;
        case 4:
          AutoRouter.of(context)
              .pushAndPopUntil(SettingRoute(), predicate: (_) => false);
        default:
          break;
      }
      ref
          .read(transitionProvider.notifier)
          .transitionTo(index); // Update the index for the transition indicator
    }

    return Container(
       decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF181D36),  // First color in gradient
            Color(0xFF070B1E),  // Second color in gradient
          ],
        ),
      ),
      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Stack(
            children: [
              // BottomNavigationBar
              BottomNavigationBar(
                currentIndex: currentIndex,
                
                selectedItemColor: Colors.white,
                unselectedItemColor: Color(0x66FFFFFF),
                backgroundColor: Colors.transparent,
                selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
                unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12), 
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: _getIconSVG(
                      index: 0,
                      selectedIcon: SVGIcons.home,
                      unselectedIcon: SVGIcons.home_outlined,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: _getIconSVG(
                      index: 1,
                      selectedIcon: SVGIcons.coin,
                      unselectedIcon:  SVGIcons.coin_outlined,
                    ),
                    label: "Tokens",
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(width: 20), // This creates the space
                    label: "", // Empty label for the spacer
                  ),
                  BottomNavigationBarItem(
                    icon: _getIcon(
                      index: 3,
                      selectedIcon: FontAwesomeIcons.solidClock,
                      unselectedIcon: FontAwesomeIcons.clock,
                    ),
                    label: "Order",
                  ),
                  BottomNavigationBarItem(
                    icon: _getIcon(
                      index: 4,
                      selectedIcon: FontAwesomeIcons.userLarge,
                      unselectedIcon: FontAwesomeIcons.user,
                    ),
                    label: "Settings",
                  ),
                ],
                onTap: _onTabTapped,
              ),
            
            ],
          ),
          
        ),
        
      ),
    );
  }
}
