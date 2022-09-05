import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:new_weather/screens/home_screen/home_screen.dart';
import 'package:new_weather/screens/login_screen/login_screen.dart';
import 'package:new_weather/screens/reader/reader_screen.dart';
import 'package:new_weather/screens/registration_screen/registration_screen.dart';
import 'package:new_weather/services/routes/route_names.dart';

class AppPages {
  static dynamic get pages => [
        GetPage(
            name: RouteNames.registration, page: () => RegistrationScreen()),
        GetPage(name: RouteNames.home, page: () => HomeScreen()),
        GetPage(name: RouteNames.login, page: () => LoginScreen()),
        GetPage(name: RouteNames.reader, page: () => ReaderScreen()),
      ];
}
