import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/ui_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/appbar/drawer.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_bottom_bar.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

class AppScaffold extends ConsumerStatefulWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool showDrawer;
  final bool isVisibleBottomBar;
  final Color backgroundColor;
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.showDrawer = false, // Default value for showDrawer
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
    return Scaffold(
      
      backgroundColor:  widget.backgroundColor,
      drawer: widget.showDrawer ? UserDrawer() : null,
      appBar: widget.appBar,
      body: widget.body,
              extendBodyBehindAppBar: true, // ทำให้เนื้อหาทับแอปบาร์

      bottomNavigationBar: widget.isVisibleBottomBar ? const BottomNavBar():null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2F5CFF), // Gradient color start
              Color(0xFF8D1BBC), // Gradient color end
            ],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0x3B3B3B40), // Drop shadow color
              offset: Offset(0, 3), // Horizontal and vertical shadow offset
              blurRadius: 6, // Blur effect for the shadow
              spreadRadius: 0, // How much the shadow spreads
            ),
          ],
        ),
        child: widget.isVisibleBottomBar ? FloatingActionButton(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          onPressed: () {
            ref.read(transitionProvider.notifier).transitionTo(2);
            AutoRouter.of(context)
                .pushAndPopUntil(TokenWalletRoute(), predicate: (_) => false);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // ทำให้ปุ่มกลมๆ
          ),
          child: Icon(FontAwesomeIcons.wallet, color: Colors.white),
        ):SizedBox.shrink(),
      ),
    );
  }
}
