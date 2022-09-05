import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../screens/home_screen/models/geocoding_model.dart';
import '../../screens/home_screen/models/one_call_daily_Model.dart';
import '../../screens/home_screen/models/one_call_history_model.dart';
import '../../screens/home_screen/models/weather_model.dart';
import '../../utils/constants.dart';

class ApiClient {
  GeocodingModel geocodingData = GeocodingModel();
  OneCallDailyModel oneCallDailyData = OneCallDailyModel();
  OneCallHistoryModel oneCallHistoryData = OneCallHistoryModel();
  WeatherModel weatherModelData = WeatherModel();

  Future<GeocodingModel> getGeocodingApi(cityName) async {
    try {
      final response = await http.get(Uri.parse(
          "${Constants.baseUrl}/geo/1.0/direct?q=$cityName&limit=1&appid="
          "${Constants.apiKey}&units=metric"));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        log('In getGeocodingApi');
        for (var city in data) {
          geocodingData = GeocodingModel.fromJson(city);
        }
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }

    return geocodingData;
  }

  Future<WeatherModel> getWeatherApi({required lat, required lon}) async {
    try {
      final response = await http.get(Uri.parse(
          "${Constants.baseUrl}/data/2.5/weather?lat=$lat&lon=$lon&appid=${Constants.apiKey}&units=metric"));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        log('In getWeatherApi');

        weatherModelData = WeatherModel.fromJson(data);
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return weatherModelData;
  }

//https://api.openweathermap.org/data/2.5/weather?lat=12.9716&lon=77.5946&appid=bbac3eaf85ac5dc3e1678ad48bbc5ac7&units=metric
  Future<OneCallDailyModel> getOneCallDailyApi(
      {required lat, required lon}) async {
    try {
      final response = await http.get(Uri.parse(
          "${Constants.baseUrl}/data/2.5/onecall?lat=$lat&lon=$lon&exclude=current,"
          "minutely,hourly,alerts&appid=${Constants.apiKey}&units=metric"));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        log('In getOneCallDailyApi');

        oneCallDailyData = OneCallDailyModel.fromJson(data);
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return oneCallDailyData;
  }

  Future<OneCallHistoryModel> getOneCallHistoryApi(
      {required lat, required lon, required time}) async {
    try {
      log(time.toString());
      final response = await http.get(Uri.parse(
          // 'http://api.openweathermap.org/data/2.5/onecall/timemachine?lat=60.99&lon=30.9&dt=1645155083&appid=bbac3eaf85ac5dc3e1678ad48bbc5ac7&units=metric'));
          "${Constants.baseUrl}/data/2.5/onecall/timemachine?lat=$lat&lon=$lon&dt=$time&appid=${Constants.apiKey}&units=metric"));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        log('In getOneCallHistoryApi');

        oneCallHistoryData = OneCallHistoryModel.fromJson(data);
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    return oneCallHistoryData;
  }
}
