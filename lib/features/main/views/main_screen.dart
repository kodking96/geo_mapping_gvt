import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_location_controller.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:geo_mapping_app/features/main/views/components/main_app_bar.dart';
import 'package:geo_mapping_app/features/main/views/components/main_body.dart';
import 'package:geo_mapping_app/features/main/views/components/main_bottom_bar.dart';
import 'package:geo_mapping_app/features/save/controllers/save_controller.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final mainViewController = Get.put(MainViewController());
  final mainLocationController = Get.find<MainLocationController>();
  final saveController = Get.put(SaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: MainBody(),
      bottomNavigationBar: MainBottomBar(),
    );
  }
}
