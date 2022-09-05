import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/routes/route_names.dart';
import '../../utils/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        Get.offAllNamed(RouteNames.login);
        print('Get.toNamed(RouteNames.login);');
      } else if (event.isAnonymous) {
        Get.offAllNamed(RouteNames.home, arguments: {'isAnonymous': true});
        print('else if (event.isAnonymous)');
      } else {
        Get.offAllNamed(RouteNames.home, arguments: {'isAnonymous': false});
        print('else');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Icon(Icons.cloud)),
    );
  }
}
