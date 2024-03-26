import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainBottomBar extends StatelessWidget {
  MainBottomBar({super.key});

  final mainViewController = Get.find<MainViewController>();
  final notchController = NotchBottomBarController();

  final bottomBarItems = <BottomBarItem>[
    BottomBarItem(
      inActiveItem: Icon(
        Icons.start_outlined,
        color: Colors.green.withOpacity(0.5),
      ),
      activeItem: Icon(
        Icons.start_rounded,
        color: Colors.green,
      ),
      itemLabel: "Start",
    ),
    BottomBarItem(
      inActiveItem: Icon(
        Icons.save_outlined,
        color: Colors.blue.withOpacity(0.5),
      ),
      activeItem: Icon(
        Icons.save_rounded,
        color: Colors.blue,
      ),
      itemLabel: "Save",
    ),
    BottomBarItem(
      inActiveItem: Icon(
        Icons.stop_outlined,
        color: Colors.red.withOpacity(0.5),
      ),
      activeItem: Icon(
        Icons.stop,
        color: Colors.red,
      ),
      itemLabel: "Stop",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SalomonBottomBar(
        currentIndex: mainViewController.viewIndex.value,
        onTap: (index) => {
          mainViewController.setViewIndex(index),
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.start),
            title: Text("Start"),
            selectedColor: Colors.green,
            unselectedColor: Colors.green.withOpacity(0.5),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.save),
            title: Text("Save"),
            selectedColor: Colors.blue,
            unselectedColor: Colors.blue.withOpacity(0.5),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.stop),
            title: Text("Stop"),
            selectedColor: Colors.red,
            unselectedColor: Colors.red.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
