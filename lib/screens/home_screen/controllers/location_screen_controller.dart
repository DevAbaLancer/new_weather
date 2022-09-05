import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:location/location.dart';

class LocationScreenController extends GetxController {
  var location = Location();
  var serviceEnabled = false.obs;
  var permissionGranted = PermissionStatus.deniedForever.obs;
  var latidude = 0.0.obs;
  var longitude = 0.0.obs;
  var model = 'mobile'.obs;

  var isLoading = false.obs;

  // @override
  // void onInit() async {
  //   super.onInit();

  //   await checkServiceEnabled();
  //   await checkPermissionEnabled();
  //   await getLocation();
  // }

  checkServiceEnabled() async {
    serviceEnabled.value = await location.serviceEnabled();
    if (!serviceEnabled.value) {
      serviceEnabled.value = await location.requestService();
      if (serviceEnabled.value) {
        return;
      }
    }
  }

  checkPermissionEnabled() async {
    permissionGranted.value = await location.hasPermission();
    if (permissionGranted.value == PermissionStatus.denied) {
      permissionGranted.value = await location.requestPermission();
      if (permissionGranted.value != PermissionStatus.granted) {
        return;
      }
    }
  }

  getLocation() async {
    var currentLocation = await location.getLocation();

    latidude.value = currentLocation.latitude ?? 0.0;
    longitude.value = currentLocation.longitude ?? 0.0;
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    model.value = androidInfo.model ?? 'mobile2';
    print('Running on ${androidInfo.model}');
  }
}
