import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';

import 'package:new_weather/screens/splash%20screen/splash_screen.dart';

import 'package:new_weather/services/routes/app_pages.dart';
import 'package:new_weather/utils/custom_theme.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        title: 'New Weather',
        theme: CustomTheme.classicTheme,
        home: SplashScreen(),
      );
    });
  }
}
