

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/configs/notifications_platform_configs.dart';
import 'package:versa_app_tutorial_cleanarch/main/app.dart';
import 'package:versa_app_tutorial_cleanarch/main/app_env.dart';
import 'package:versa_app_tutorial_cleanarch/main/observers.dart';

void main() => mainCommon(AppEnvironment.PROD);
  

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  
  await NotificationConfig.initialize();  
  
  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: VersaMainApp(),
  ));
}
