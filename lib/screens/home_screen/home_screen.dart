import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_weather/screens/home_screen/controllers/location_screen_controller.dart';
import 'package:new_weather/screens/home_screen/widgets/daily_weather_card.dart';
import 'package:new_weather/screens/home_screen/widgets/history_weather_card.dart';

import 'package:new_weather/screens/home_screen/widgets/weekly_weather_card.dart';
import 'package:new_weather/screens/reader/controller/reader_controller.dart';
import 'package:new_weather/services/routes/route_names.dart';

import 'package:new_weather/utils/styles.dart';

import 'controllers/articles_controller.dart';
import 'controllers/one_call_daily_controller.dart';
import 'controllers/one_call_history_controller.dart';
import 'controllers/weather_controller.dart';
import 'widgets/custom_divider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationScreenController _locationScreenController =
      Get.put(LocationScreenController());
  final OneCallDailyController _oneCallDailyController =
      Get.put(OneCallDailyController());

  final OneCallHistoryController _oneCallHistoryController =
      Get.put(OneCallHistoryController());

  final WeatherController _weatherModelController =
      Get.put(WeatherController());
  final ArticlesController _articlesController = Get.put(ArticlesController());
  final ReaderController _readerController = Get.put(ReaderController());
  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  final RxInt _selectedIndex = 0.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!Get.arguments['isAnonymous']) {
      onInIt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Weather', style: Styles.appBarTitleTS),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAllNamed(RouteNames.login);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      // bottomNavigationBar: Obx(() {
      //   return BottomNavigationBar(
      //     unselectedItemColor: Colors.grey,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home, size: 20, color: Colors.white),
      //           activeIcon: Icon(Icons.home, size: 20, color: Colors.orange),
      //           label: 'Home',
      //           backgroundColor: Colors.black),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.file_copy, size: 20, color: Colors.white),
      //         activeIcon: Icon(Icons.file_copy, size: 20, color: Colors.orange),
      //         label: 'Explore',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite, size: 20, color: Colors.white),
      //         activeIcon: Icon(Icons.favorite, size: 20, color: Colors.orange),
      //         label: 'Saved',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications, size: 20, color: Colors.white),
      //         activeIcon:
      //             Icon(Icons.notifications, size: 20, color: Colors.orange),
      //         label: 'Profile',
      //       ),
      //     ],
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: _selectedIndex.value,
      //     selectedItemColor: Colors.white,
      //     iconSize: 40,
      //     onTap: _onItemTapped,
      //     elevation: 5,
      //   );
      // }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
                visible: !Get.arguments['isAnonymous'],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDivider(),
                    Column(
                      children: [
                        Column(children: [
                          GetX<WeatherController>(builder: (controller) {
                            return controller.isLoading.value
                                ? const SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : DailyWeatherCard(
                                    deviceInfo:
                                        _locationScreenController.model.value,
                                    location: controller.weatherData.value.name,
                                    image: controller
                                        .weatherData.value.weather![0].icon,
                                    temp:
                                        controller.weatherData.value.main!.temp,
                                    description: controller.weatherData.value
                                        .weather![0].description,
                                    minTemp: controller
                                        .weatherData.value.main!.tempMin,
                                    maxTemp: controller
                                        .weatherData.value.main!.tempMax,
                                    feelsLike: controller
                                        .weatherData.value.main!.feelsLike,
                                    timeZone:
                                        controller.weatherData.value.timezone,
                                  );
                          }),
                          const CustomDivider(),
                          GetX<OneCallDailyController>(
                            builder: (controller) {
                              return controller.isLoading.value
                                  ? SizedBox(
                                      height: 150,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : WeeklyWeatherCard(
                                      daily: controller
                                          .oneCallDailyData.value.daily,
                                    );
                            },
                          ),
                          const CustomDivider(),
                          GetX<OneCallHistoryController>(
                            builder: (controller) {
                              return controller.isLoading.value
                                  ? const SizedBox(
                                      height: 150,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        HistoryWeatherCard(
                                          image: controller.oneCallHistoryData
                                              .value.current!.weather![0].icon,
                                          temp: controller.oneCallHistoryData
                                              .value.current!.temp,
                                          description: controller
                                              .oneCallHistoryData
                                              .value
                                              .current!
                                              .weather![0]
                                              .description,
                                          humidity: controller
                                              .oneCallHistoryData
                                              .value
                                              .current!
                                              .humidity,
                                          feelsLike: controller
                                              .oneCallHistoryData
                                              .value
                                              .current!
                                              .feelsLike,
                                          date: controller.oneCallHistoryData
                                              .value.current!.dt,
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ]),
                        const CustomDivider(),
                      ],
                    ),
                  ],
                )),
            Container(
              color: Colors.black,
              height: 400,
              child: GetX<ArticlesController>(builder: (controller) {
                return
                    //  controller.isLoading.value
                    //     ? const SizedBox(
                    //         height: 150,
                    //         child: Center(
                    //           child: CircularProgressIndicator(),
                    //         ),
                    //       )
                    //     :
                    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5),
                          child: Text('Articles', style: Styles.cardTS),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.listOfArticles.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              onTap: (() async {
                                await _readerController.loadAsset(
                                    controller.listOfArticles[index]);
                                Get.toNamed(RouteNames.reader, arguments: {
                                  'title': controller.nameOfArticles[index]
                                });
                              }),
                              title: Text(controller.nameOfArticles[index],
                                  style: Styles.cardSubtitleTS),
                            );
                          })),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void onInIt() async {
    await _locationScreenController.checkServiceEnabled();
    await _locationScreenController.checkPermissionEnabled();
    await _locationScreenController.getLocation();
    await _locationScreenController.getDeviceInfo();
    await _oneCallDailyController.getOneCallDailyApi(
        lat: _locationScreenController.latidude.value,
        lon: _locationScreenController.longitude.value);
    await _oneCallHistoryController.getOneCallHistoryApi(
        lat: _locationScreenController.latidude.value,
        lon: _locationScreenController.longitude.value,
        time: ((DateTime.now().millisecondsSinceEpoch -
                (24 * 60 * 60 * 1000) -
                19800000) ~/
            1000));
    await _weatherModelController.getWeatherApi(
        lat: _locationScreenController.latidude.value,
        lon: _locationScreenController.longitude.value);
  }
}
