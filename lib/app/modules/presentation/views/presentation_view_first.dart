import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class PresentationViewFirst extends StatelessWidget {
  const PresentationViewFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        top: Get.statusBarHeight.h,
        bottom: 120.h,
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
                'assets/images/webps/banner_fgts2.webp',
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
                  text: 'Faça uma simulação de',
                  style: TextStyle(
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w700,
                    color: accentColor,
                  ),
                  children: const <InlineSpan>[
                    TextSpan(
                      text: ' emprestimo rápido e fácil!',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Simule seu empréstimo rápido e fácil com apenas alguns cliques. Descubra as melhores opções de crédito para atender às suas necessidades financeiras. Faça agora mesmo a simulação e tenha acesso a uma solução financeira customizada para você.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
