import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:new_weather/utils/catcher.dart';

class RegistrationController extends GetxController {
  createUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.isSnackbarOpen
            ? null
            : Get.snackbar('Error', 'The password provided is too weak');
        //  print('.');
      } else if (e.code == 'email-already-in-use') {
        Get.isSnackbarOpen
            ? null
            : Get.snackbar('Error', 'The account already exists for that emai');
        //print('l.');
      }
    } catch (e) {
      Catcher.andHandler(e);
    }
  }
}
