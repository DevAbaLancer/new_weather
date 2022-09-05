import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_weather/utils/catcher.dart';

import '../../../services/api_call/api_client.dart';
import '../models/one_call_daily_Model.dart';

class OneCallDailyController extends GetxController {
  var isLoading = true.obs;
  var oneCallDailyData = OneCallDailyModel().obs;

  // @override
  // void onInit() {
  //   getOneCallDailyApi(lat: 12.9716, lon: 77.5946);
  //   super.onInit();
  // }

  Future<void> getOneCallDailyApi({required lat, required lon}) async {
    try {
      isLoading(true);
      oneCallDailyData.value =
          await ApiClient().getOneCallDailyApi(lat: lat, lon: lon);
    } catch (e) {
      Catcher.andHandler(e);
      isLoading(false);
      oneCallDailyData.refresh();
      update();
    } finally {
      isLoading(false);
      oneCallDailyData.refresh();
      update();
    }
  }
}
