import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class FinalLocationComponent extends StatelessWidget {
  FinalLocationComponent({
    super.key,
  });

  final saveController = Get.find<SaveController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Final Location",
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            controller: saveController.finalLocationController,
            enabled: false,
          ),
        ],
      ),
    );
  }
}
