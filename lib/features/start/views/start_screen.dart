import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_location_controller.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final mainViewController = Get.find<MainViewController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          color: Colors.green.withOpacity(0.5),
          child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Lottie.asset(
                  "assets/lotties/marker_lottie.json",
                  width: 200,
                ),
                Expanded(
                  child: Text(
                    "Click Start to capture initial coordinate",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Lottie.asset(
          "assets/lotties/drive_speed.json",
          height: 250,
        ),
        StartButton(),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  StartButton({
    super.key,
  });

  final mainLocationController = Get.find<MainLocationController>();
  final mainViewController = Get.find<MainViewController>();
  final saveController = Get.find<SaveController>();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      height: 50,
      color: Colors.green,
      child: Text(
        "Start",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () async {
        LocationData? initialPoint = await mainLocationController.getLocation();
        saveController.initialLocationController.text =
            "${initialPoint!.latitude}, ${initialPoint!.longitude}";
        saveController.setInitialPoint(
          latitude: initialPoint.latitude.toString(),
          longitude: initialPoint.longitude.toString(),
        );
        mainViewController.setViewIndex(1);
      },
    );
  }
}
