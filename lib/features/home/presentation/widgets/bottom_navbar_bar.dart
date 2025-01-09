import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

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
          transionNavigator.index == index ? selectedIcon : unselectedIcon);
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
        default:
          break;
      }
      ref
          .read(transitionProvider.notifier)
          .transitionTo(index); // Update the index for the transition indicator
    }

    // List of pages to navigate to

    return Theme(
      data: Theme.of(context).copyWith(
        // Remove ripple effect
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Stack(children: [
        BottomNavigationBar(
          
          currentIndex: currentIndex, // index ของไอคอนตรงกลาง
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xFF0D2B5B),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _getIcon(
                index: 0,
                selectedIcon: Icons.home,
                unselectedIcon: Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _getIcon(
                index: 1,
                selectedIcon: Icons.now_widgets,
                unselectedIcon: Icons.now_widgets_outlined,
              ),
              label: "Token List",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: _getIcon(
                  index: 2,
                  selectedIcon: Icons.wallet,
                  unselectedIcon: Icons.wallet_outlined,
                ),
              ),
              label: "Lock",
            ),
            BottomNavigationBarItem(
              icon: _getIcon(
                index: 3,
                selectedIcon: Icons.shopping_cart,
                unselectedIcon: Icons.shopping_cart_outlined,
              ),
              label: "Reserve Token",
            ),
            BottomNavigationBarItem(
              icon: _getIcon(
                index: 4,
                selectedIcon: Icons.settings,
                unselectedIcon: Icons.settings_outlined,
              ),
              label: "Settings",
            ),
          ],
          onTap: _onTabTapped, // Handle tab tap action
        ),
        Positioned(
          bottom: 60, // เพิ่มระยะห่างจากด้านล่าง
          left: (MediaQuery.of(context).size.width / 5) * currentIndex +
              (MediaQuery.of(context).size.width / 10) -
              20, // คำนวณตำแหน่งให้เหมาะสม
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: transionNavigator.isVisible ? 1.0 : 0.0, // ควบคุม opacity
            child: Container(
              width: 40, // ขนาดของเส้น indicator ที่สั้นลง
              height: 3,
              color: Colors.orange, // สีของ indicator
            ),
          ),
        ),
      ]),
    );
  }
}
