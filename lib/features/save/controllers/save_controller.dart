import 'package:flutter/material.dart';
import 'package:geo_mapping_app/models/location_point.dart';
import 'package:get/get.dart';
import 'package:quds_db/quds_db.dart';

class SaveController extends GetxController {
  final regions = <String>[
    "Northern",
    "Central",
    "Southern",
    "Western",
    "Easten",
  ];

  final locationType = <String>[
    "Town",
    "Trading Center",
    "City",
  ];

  final districts = <String>[
    "Balaka",
    "Blantyre",
    "Chikwawa",
    "Chiradzulu",
    "Chitipa",
    "Dedza",
    "Dowa",
    "Karonga",
    "Kasungu",
    "Likoma",
    "Lilongwe",
    "Machinga",
    "Mangochi",
    "Mchinji",
    "Mulanje",
    "Mwanza",
    "Mzimba",
    "Neno",
    "Nkhata Bay",
    "Nkhotakota",
    "Nsanje",
    "Ntcheu",
    "Ntchisi",
    "Phalombe",
    "Rumphi",
    "Salima",
    "Thyolo",
    "Zomba",
  ];

  late TextEditingController limitController;
  late TextEditingController initialLocationController;
  late TextEditingController finalLocationController;

  var districtSet = false.obs;
  var district = "".obs;
  var regionSet = false.obs;
  var region = "".obs;
  var locTypeSet = false.obs;
  var locType = "".obs;

  var initialLatitude = "".obs;
  var finalLatitude = "".obs;
  var initialLongitude = "".obs;
  var finalLongitude = "".obs;
  var initialTime = "".obs;
  var finalTime = "".obs;

  var startTime = (DateTime.now()).obs;
  var stopTime = (DateTime.now()).obs;

  @override
  void onReady() {
    super.onReady();
    limitController = TextEditingController();
    initialLocationController = TextEditingController();
    finalLocationController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    limitController.dispose();
  }

  void setDistrict(String dist) {
    district.value = dist;
  }

  void setDistricSet(bool value) {
    districtSet.value = value;
  }

  void setRegion(String regn) {
    region.value = regn;
  }

  void setRegionSet(bool value) {
    regionSet.value = value;
  }

  void setLocationType(String locTyp) {
    locType.value = locTyp;
  }

  void setLocTypeSet(bool value) {
    locTypeSet.value = value;
  }

  String? districtValidator(String? value) {
    if (value == null)
      return "Region cant be empty";
    else {
      return null;
    }
  }

  String? locationValidator(String? value) {
    if (value == null)
      return "Region cant be empty";
    else {
      return null;
    }
  }

  String? regionValidator(String? value) {
    if (value == null)
      return "Region cant be empty";
    else {
      return null;
    }
  }

  bool validateSave() {
    if (district.value == "" &&
        region.value == "" &&
        locType.value == "" &&
        limitController.text == "") {
      return false;
    }
    return true;
  }

  void clearData() {
    limitController.clear();
    initialLocationController.clear();
    finalLocationController.clear();
    districtSet.value = false;
    district.value = "";
    regionSet.value = false;
    region.value = "";
    locTypeSet.value = false;
    locType.value = "";
  }

  void setInitialPoint({required String latitude, required String longitude}) {
    initialLatitude.value = latitude;
    initialLongitude.value = longitude;
    startTime.value = DateTime.now();
  }

  void setFinalPoint({required String latitude, required String longitude}) {
    finalLatitude.value = latitude;
    finalLongitude.value = longitude;
    stopTime.value = DateTime.now();
  }

  GeoProvider geoProvider = GeoProvider();

  Future<void> insertGeo() async {
    Geo g = Geo();
    // coordinates
    g.initialLatitude.value = initialLatitude.value;
    g.finalLatitude.value = finalLatitude.value;
    g.initialLongitude.value = initialLongitude.value;
    g.finalLongitude.value = finalLongitude.value;
    // location
    g.district.value = district.value;
    g.locationType.value = locType.value;
    g.region.value = region.value;
    // time
    g.startTime.value = startTime.value;
    g.stopTime.value = stopTime.value;
  }
}

class GeoProvider extends DbTableProvider<Geo> {
  GeoProvider() : super(() => Geo());

  String get tableName => 'Geo';
}
