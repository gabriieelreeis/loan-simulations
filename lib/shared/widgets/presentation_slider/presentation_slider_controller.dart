import 'package:get/get.dart';

class PresentationSliderController extends GetxController {
  final _initialPage = 0.obs;
  set initialPage(int value) => _initialPage.value = value;
  int get initialPage => _initialPage.value;

  final _lastIndex = false.obs;
  set lastIndex(bool value) => _lastIndex.value = value;
  bool get lastIndex => _lastIndex.value;

  @override
  void onInit() {
    super.onInit();
  }
}
