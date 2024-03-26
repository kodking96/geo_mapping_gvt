import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:geo_mapping_app/features/save/views/save_screen.dart';
import 'package:geo_mapping_app/features/start/views/start_screen.dart';
import 'package:geo_mapping_app/features/stop/views/stop_screen.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  MainBody({super.key});

  final mainViewController = Get.find<MainViewController>();

  final mainViews = <Widget>[
    StartScreen(),
    SaveScreen(),
    StopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => mainViews[mainViewController.viewIndex.value],
    );
  }
}
