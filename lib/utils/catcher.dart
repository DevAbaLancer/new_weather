import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

class Catcher {
  static andHandler(e) {
    if (e is SocketException) {
      //treat SocketException
      Get.isSnackbarOpen
          ? null
          : Get.snackbar('Error', 'Could not connect to the internet');
    } else if (e is TimeoutException) {
      //treat TimeoutException
      Get.isSnackbarOpen ? null : Get.snackbar('Error', 'Connection Timed out');
    } else {
      Get.isSnackbarOpen ? null : Get.snackbar('Error', 'Something went wrong');
    }
  }
}
