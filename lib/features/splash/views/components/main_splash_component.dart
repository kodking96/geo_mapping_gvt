import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainSplashComponent extends StatelessWidget {
  const MainSplashComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/lotties/marker_lottie.json",
          width: 100,
        ),
        Image.asset(
          "assets/images/govt_logo.png",
          width: 200,
        ),
      ],
    );
  }
}
