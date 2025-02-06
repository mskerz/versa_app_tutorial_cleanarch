import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class VersaMainApp extends ConsumerStatefulWidget {
  VersaMainApp({super.key});

  @override
  _VersaMainAppState createState() => _VersaMainAppState();
}

class _VersaMainAppState extends ConsumerState<VersaMainApp> {
  late final AppRouter appRouter;

  @override

  void initState() {
    super.initState();
       appRouter =  AppRouter(ref);
   }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'Versa',

      routerConfig: appRouter.config(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      
    );
  }
}