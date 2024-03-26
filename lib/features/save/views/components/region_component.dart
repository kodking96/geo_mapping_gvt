import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class RegionSaveComponent extends StatelessWidget {
  RegionSaveComponent({
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
            "Region",
            style: TextStyle(fontSize: 20),
          ),
          Obx(
            () => DropdownButtonFormField(
              value: saveController.regionSet.value
                  ? saveController.region.value
                  : null,
              //validator: saveController.regionValidator(value),
              items: saveController.regions
                  .map(
                    (region) => DropdownMenuItem(
                      child: Text(region),
                      value: region,
                    ),
                  )
                  .toList(),
              onChanged: (region) => {
                saveController.setRegion(region!),
                saveController.setRegionSet(true),
              },
            ),
          ),
        ],
      ),
    );
  }
}
