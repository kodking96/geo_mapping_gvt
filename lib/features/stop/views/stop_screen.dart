import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_location_controller.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class StopScreen extends StatelessWidget {
  StopScreen({
    super.key,
  });

  final mainViewController = Get.find<MainViewController>();
  final saveController = Get.find<SaveController>();
  final mainLocationController = Get.find<MainLocationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          color: Colors.red.withOpacity(0.5),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Lottie.asset(
                  "assets/lotties/stop_lottie.json",
                  height: 150,
                ),
                Expanded(
                  child: Text(
                    "Click Stop to capture final coordinate",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        Lottie.asset(
          "assets/lotties/drive_lottie.json",
          height: 250,
        ),
        StopButton(),
      ],
    );
  }
}

class StopButton extends StatelessWidget {
  StopButton({
    super.key,
  });

  final saveController = Get.find<SaveController>();
  final mainViewController = Get.find<MainViewController>();
  final mainLocationController = Get.find<MainLocationController>();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      height: 50,
      color: Colors.red,
      child: Text(
        "Stop",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () async {
        LocationData? finalPoint = await mainLocationController.getLocation();
        saveController.finalLocationController.text =
            "${finalPoint!.latitude}, ${finalPoint!.longitude}";
        saveController.setFinalPoint(
          latitude: finalPoint.latitude.toString(),
          longitude: finalPoint.longitude.toString(),
        );
        mainViewController.setViewIndex(1);
      },
    );
  }
}
