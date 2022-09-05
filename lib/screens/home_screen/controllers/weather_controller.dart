import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/api_call/api_client.dart';
import '../../../utils/catcher.dart';
import '../models/weather_model.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weatherData = WeatherModel().obs;

  // @override
  // void onInit() {
  //   getWeatherApi(lat: 51.5073219, lon: -0.1276474);
  //   super.onInit();
  // }

  Future<void> getWeatherApi({required lat, required lon}) async {
    try {
      isLoading(true);
      weatherData.value = await ApiClient().getWeatherApi(lat: lat, lon: lon);
    } catch (e) {
      Catcher.andHandler(e);
      isLoading(false);
      weatherData.refresh();
      update();
    } finally {
      isLoading(false);
      weatherData.refresh();
      update();
    }
  }
}
