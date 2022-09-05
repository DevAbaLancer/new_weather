import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:new_weather/utils/catcher.dart';

import '../../../services/routes/route_names.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        // Get.offAllNamed(RouteNames.login);
        // print('Get.toNamed(RouteNames.login);');
      } else if (event.isAnonymous) {
        Get.offAllNamed(RouteNames.home, arguments: {'isAnonymous': true});
        // print('else if (event.isAnonymous)');
      } else {
        Get.offAllNamed(RouteNames.home, arguments: {'isAnonymous': false});
        // print('else');
      }
    });
  }

  loginUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.isSnackbarOpen
            ? null
            : Get.snackbar('Error', 'No user found for that email');

        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.isSnackbarOpen
            ? null
            : Get.snackbar('Error', 'Wrong password provided for that user');
        // print('Wrong password provided for that user.');
      }
    } catch (e) {
      Catcher.andHandler(e);
    }
  }

  skipLogIn() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      Get.isSnackbarOpen
          ? null
          : Get.snackbar('Message', 'Signed in with temporary account.');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.isSnackbarOpen
              ? null
              : Get.snackbar('Error',
                  'Anonymous auth hasn\'t been enabled for this projet');

          break;
        default:
          Catcher.andHandler(e);
      }
    }
  }
}
