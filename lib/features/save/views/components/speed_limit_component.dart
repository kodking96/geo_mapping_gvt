import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class SpeedLimitComponent extends StatelessWidget {
  SpeedLimitComponent({
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
            "Speed Limit",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            controller: saveController.limitController,
            keyboardType: TextInputType.number,
            onChanged: (value) => {},
          ),
        ],
      ),
    );
  }
}
