import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/app/modules/presentation/views/presentation_view_first.dart';
import 'package:loan_simulations/app/modules/presentation/views/presentation_view_second.dart';
import 'package:loan_simulations/app/routes/app_pages.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';
import 'package:loan_simulations/shared/widgets/buttons/default_button_widget.dart';
import 'package:loan_simulations/shared/widgets/presentation_slider/presentation_slider_widget.dart';

class PresentationView extends StatelessWidget {
  const PresentationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PresentationSliderWidget(
      physics: const NeverScrollableScrollPhysics(),
      items: const [
        PresentationViewFirst(),
        PresentationViewSecond(),
      ],
      customLastItemButton: DefaultButtonWidget(
        title: 'Continuar'.toUpperCase(),
        textColor: Colors.white,
        bgColor: accentBackground,
        onTap: () => Get.toNamed(Routes.simulation),
      ),
      customFullNextButton: DefaultButtonWidget(
        title: 'Próximo'.toUpperCase(),
        textColor: Colors.white,
        bgColor: accentBackground,
      ),
    );
  }
}
