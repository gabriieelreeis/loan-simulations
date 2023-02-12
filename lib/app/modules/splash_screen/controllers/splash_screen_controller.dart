import 'package:get/get.dart';
import 'package:loan_simulations/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    await _simulateAwaiting();
    Get.offAllNamed(Routes.presentation);
    super.onInit();
  }

  Future<void> _simulateAwaiting() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
