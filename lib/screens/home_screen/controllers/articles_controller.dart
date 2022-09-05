import 'package:get/get.dart';

class ArticlesController extends GetxController {
  var isLoading = true.obs;
  var listOfArticles = [
    'assets/file/text/Monsoon.txt',
    'assets/file/text/Summer.txt',
    'assets/file/text/Winter.txt',
  ].obs;
  var nameOfArticles = [
    'Monsoon',
    'Summer',
    'Winter',
  ].obs;

  // Future<void> getOneCallDailyApi({required lat, required lon}) async {
  //   try {
  //     isLoading(true);
  //     oneCallDailyData.value =
  //         await ApiClient().getOneCallDailyApi(lat: lat, lon: lon);
  //   } catch (e) {
  //     Catcher.andHandler(e);
  //     isLoading(false);
  //     oneCallDailyData.refresh();
  //     update();
  //   } finally {
  //     isLoading(false);
  //     oneCallDailyData.refresh();
  //     update();
  //   }
  // }
}
