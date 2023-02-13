import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class PresentationViewSecond extends StatelessWidget {
  const PresentationViewSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: Get.statusBarHeight.h,
        bottom: 150.h,
      ),
      color: primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Image.asset(
                'assets/images/webps/emprestimo-consignado.webp',
                width: ScreenUtil().screenWidth * .8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 40.h,
              ),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: 'Escolha a melhor opção de',
                  style: TextStyle(
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                  ),
                  children: const <InlineSpan>[
                    TextSpan(
                      text: ' pagamento para você',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Nós oferecemos a você a possibilidade de escolher o valor desejado para o seu pagamento, seja ele à vista ou parcelado em até 84 vezes. Trabalhamos com as melhores instituições financeiras e convênios para garantir a segurança e comodidade do seu pagamento.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
