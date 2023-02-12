import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put<SplashScreenController>(
        SplashScreenController(),
      )
    ];
  }
}
