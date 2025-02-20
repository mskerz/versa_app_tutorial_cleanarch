import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/appbar/drawer.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_bottom_bar.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class AppScaffold extends ConsumerStatefulWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool isVisibleBottomBar;
  final Color backgroundColor;
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.isVisibleBottomBar = true, // Default value for isVisibleBottomBar
    required this.backgroundColor,
  });

  @override
  ConsumerState<AppScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<AppScaffold> {
  @override
  void initState() {
    super.initState();
    // Add your initialization logic here
  }

  @override
  void dispose() {
    // Add your cleanup logic here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);
    final themeMode =  ref.watch(appThemeProvider);
    final gradient = theme.extension<GradientBackgroundExtention>()!;
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar,
      body:    LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // ถ้าหน้าจอกว้าง เช่น tablet หรือ desktop
            return widget.body ?? Center(child: Text('Default Body for Large Screen'));
          } else {
            // ถ้าหน้าจอเล็ก เช่น มือถือ
            return widget.body ?? Center(child: Text('Default Body for Small Screen'));
          }
        },
      ),
      extendBodyBehindAppBar: true, // ทำให้เนื้อหาทับแอปบาร์
      extendBody: true, // ให้ BottomAppBar โปร่งใสและต่อเนื่องกับพื้นหลัง

      bottomNavigationBar:
          widget.isVisibleBottomBar ? const BottomNavBar() : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          
          border: GradientBoxBorder(
              width: 1,
              gradient:  gradient.gradientFloatingButtonBorder ??  const LinearGradient(
                  colors: [Colors.transparent, Colors.transparent])),
          gradient: gradient.gradientFloatingButton,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
          themeMode ==  ThemeMode.dark ?  BoxShadow(
            
              color: Color(0x3B3B3B40), // Drop shadow color
              offset: Offset(0, 3), // Horizontal and vertical shadow offset
              blurRadius: 6, // Blur effect for the shadow
              spreadRadius: 0, // How much the shadow spreads
            ):BoxShadow(),
          ],
        ),
        child: widget.isVisibleBottomBar
            ? FloatingActionButton(
              elevation: 0,
                foregroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  ref.read(transitionProvider.notifier).transitionTo(2);
                  AutoRouter.of(context).pushAndPopUntil(TokenWalletRoute(),
                      predicate: (_) => false);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // ทำให้ปุ่มกลมๆ
                ),
                child: Icon(FontAwesomeIcons.wallet,
                    color: Theme.of(context).primaryColor),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
