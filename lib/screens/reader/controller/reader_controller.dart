import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

import '../../../utils/catcher.dart';

class ReaderController extends GetxController {
  var isLoading = false.obs;

  var content = "".obs;
  var isLoadingFile = false.obs;

  var defaultSize = 20.0.obs;
  var isBold = false.obs;
  // @override
  // void onInit() async {

  //   super.onInit();
  // }

  Future<void> loadAsset(String file) async {
    isLoadingFile.value = true;

    try {
      String data = await rootBundle.loadString(file);
      content.value = data;

      isLoadingFile.value = false;
    } catch (e) {
      Catcher.andHandler(e);
      isLoadingFile.value = false;
    }
  }
}
