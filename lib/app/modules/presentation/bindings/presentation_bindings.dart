import 'package:get/get.dart';
import 'package:loan_simulations/shared/widgets/presentation_slider/presentation_slider_controller.dart';

class PresentationBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<PresentationSliderController>(
        () => PresentationSliderController(),
      )
    ];
  }
}
