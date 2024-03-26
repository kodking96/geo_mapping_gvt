import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class DistrictSaveComponent extends StatelessWidget {
  DistrictSaveComponent({
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
            "District",
            style: TextStyle(fontSize: 20),
          ),
          Obx(
            () => DropdownButtonFormField(
              value: saveController.districtSet.value
                  ? saveController.district.value
                  : null,
              items: saveController.districts
                  .map(
                    (district) => DropdownMenuItem(
                      child: Text(district),
                      value: district,
                    ),
                  )
                  .toList(),
              onChanged: (district) => {
                saveController.setDistrict(district!),
                saveController.setDistricSet(true),
              },
            ),
          ),
        ],
      ),
    );
  }
}
