import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:geo_mapping_app/features/save/views/components/save_components.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SaveScreen extends StatelessWidget {
  SaveScreen({
    super.key,
  });

  final saveController = Get.find<SaveController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.blue.withOpacity(0.5),
              child: Container(
                height: 150,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Lottie.asset(
                      "assets/lotties/two_way_lottie.json",
                      width: 200,
                    ),
                    Expanded(
                      child: Text(
                        "Click on Save button at the bottom to record after clicking on start and save respectively",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            RegionSaveComponent(),
            DistrictSaveComponent(),
            LocationTypeComponent(),
            SpeedLimitComponent(),
            InitialLocationComponent(),
            FinalLocationComponent(),
            SizedBox(
              height: 20,
            ),
            SaveButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({
    super.key,
  });

  final saveController = Get.find<SaveController>();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      height: 50,
      color: Colors.blue,
      child: Text(
        "Save",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: () async {
        if (saveController.validateSave()) {
          await saveController.insertGeo();
          saveController.clearData();
        } else {
          Get.defaultDialog(
            title: "Fill In All Data",
            content: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please fill in each and every required point that needed",
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () => Get.back(),
                    child: Text("OK"),
                    minWidth: 40,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
