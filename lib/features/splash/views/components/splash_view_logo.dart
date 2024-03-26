import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:geo_mapping_app/features/splash/views/screens/splash_screens.dart';

class SplashViewLogo extends StatelessWidget {
  const SplashViewLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      defaultBuilder: (BuildContext context, Screen screen) {
        return LargeMobileSplashScreen();
      },
      layoutDelegate: AdaptiveLayoutDelegateWithScreenType(
        smallHandset: (BuildContext context, Screen screen) {
          return SmallTabletSplashScreen();
        },
        mediumHandset: (BuildContext context, Screen screen) {
          return MediumMobileSplashScreen();
        },
        largeHandset: (BuildContext context, Screen screen) {
          return LargeMobileSplashScreen();
        },
        smallTablet: (BuildContext context, Screen screen) {
          return SmallTabletSplashScreen();
        },
        largeTablet: (BuildContext context, Screen screen) {
          return LargeTabletSplashScreen();
        },
      ),
    );
  }
}
