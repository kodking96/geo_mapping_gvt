import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_view_controller.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    super.key,
  });

  final mainViewController = Get.find<MainViewController>();

  final titles = <String>[
    "Start",
    "Save",
    "Stop",
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        title: Text(
          titles[mainViewController.viewIndex.value],
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          !Get.isDarkMode
              ? MaterialButton(
                  onPressed: () => {
                    Get.changeThemeMode(ThemeMode.dark),
                  },
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.blueGrey,
                  ),
                )
              : MaterialButton(
                  onPressed: () => {
                    Get.changeThemeMode(ThemeMode.light),
                  },
                  child: Icon(
                    Icons.brightness_4,
                    color: Colors.yellow,
                  ),
                )
        ],
        backgroundColor: mainViewController.viewIndex.value == 0
            ? Colors.green
            : mainViewController.viewIndex.value == 1
                ? Colors.blue
                : Colors.red,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
