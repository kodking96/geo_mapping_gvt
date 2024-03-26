import 'package:get/get.dart';
import 'package:location/location.dart';

class MainLocationController extends GetxController {
  late Location location;
  late PermissionStatus permissionGranted;
  late LocationData locationData;
  late bool servicesEnabled;

  late Location initialLocation;
  late Location finalLocation;

  @override
  void onInit() {
    super.onInit();
    location = Location();
  }

  @override
  void onReady() async {
    super.onReady();
    servicesEnabled = await location.serviceEnabled();
    if (!servicesEnabled) {
      servicesEnabled = await location.requestService();
      if (servicesEnabled) {
        return;
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<LocationData?> getLocation() async {
    print("Get location");
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();

    print(
        "Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}");
    return locationData;
  }
}
