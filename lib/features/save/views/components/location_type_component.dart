import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class LocationTypeComponent extends StatelessWidget {
  LocationTypeComponent({
    super.key,
  });

  final saveController = Get.put(SaveController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location Type",
            style: TextStyle(fontSize: 20),
          ),
          Obx(
            () => DropdownButtonFormField(
              value: saveController.locTypeSet.value
                  ? saveController.locType.value
                  : null,
              items: saveController.locationType
                  .map(
                    (locationType) => DropdownMenuItem(
                      child: Text(locationType),
                      value: locationType,
                    ),
                  )
                  .toList(),
              onChanged: (locationType) => {
                saveController.setLocationType(locationType!),
                saveController.setLocTypeSet(true),
              },
            ),
          ),
        ],
      ),
    );
  }
}
