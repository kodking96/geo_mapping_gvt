import 'package:flutter/material.dart';
import 'package:geo_mapping_app/features/main/controllers/main_location_controller.dart';
import 'package:geo_mapping_app/features/main/views/main_screen.dart';
import 'package:geo_mapping_app/features/splash/views/components/splash_view_logo.dart';
import 'package:get/get.dart';
import 'package:quds_ui_kit/quds_ui_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<bool> bindingWait() async {
    WidgetsFlutterBinding.ensureInitialized();
    return true;
  }

  Future<void> injectControllers() async {
    Get.put(MainLocationController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QudsSplashView(
        futures: [
          bindingWait(),
          injectControllers(),
        ],
        onCompleted: () => Navigator.pushReplacement(
          context,
          QudsSlidePageRoute(
            transitionColor: Colors.transparent,
            duration: Duration(milliseconds: 10),
            builder: (context) => MainScreen(),
          ),
        ),
        progressIndicator: CircularProgressIndicator(),
        logo: SplashViewLogo(),
      ),
    );
  }
}
