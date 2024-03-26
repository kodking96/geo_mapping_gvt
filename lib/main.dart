import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:geo_mapping_app/config/themes/themes.dart';
import 'package:geo_mapping_app/features/splash/views/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const GeoMappingApp(),
  );
}

class GeoMappingApp extends StatelessWidget {
  const GeoMappingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Geo Mapping",
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}

class GeoMappingAppPreview extends StatelessWidget {
  const GeoMappingAppPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "Geo Mapping App",
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
    );
  }
}
