import 'package:get/get.dart';

class MainViewController extends GetxController {
  var viewIndex = 0.obs;

  void setViewIndex(int index) {
    viewIndex.value = index;
  }
}
