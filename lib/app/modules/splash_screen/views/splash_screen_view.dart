import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: Get.height,
      color: primaryBackground,
      child: Center(
        child: Pulse(
          infinite: true,
          child: SvgPicture.asset(
            'assets/images/svgs/logo_empresta.svg',
            width: ScreenUtil().screenWidth * .5,
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}
