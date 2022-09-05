import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/api_call/api_client.dart';
import '../../../utils/catcher.dart';
import '../models/one_call_history_model.dart';

class OneCallHistoryController extends GetxController {
  var isLoading = true.obs;
  var oneCallHistoryData = OneCallHistoryModel().obs;

  // @override
  // void onInit() {
  //   getOneCallHistoryApi(
  //       lat: 51.5073219,
  //       lon: -0.1276474,
  //       time: ((DateTime.now().millisecondsSinceEpoch -
  //               (24 * 60 * 60 * 1000) -
  //               19800000) ~/
  //           1000));
  //   super.onInit();
  // }

  Future<void> getOneCallHistoryApi(
      {required lat, required lon, required time}) async {
    try {
      isLoading(true);

      oneCallHistoryData.value = (await ApiClient()
          .getOneCallHistoryApi(lat: lat, lon: lon, time: time));
    } catch (e) {
      Catcher.andHandler(e);
      isLoading(false);
      oneCallHistoryData.refresh();
      update();
    } finally {
      isLoading(false);
      oneCallHistoryData.refresh();
      update();
    }
  }
}
