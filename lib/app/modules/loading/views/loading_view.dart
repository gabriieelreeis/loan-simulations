import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryBackground,
      padding: EdgeInsets.all(50.w),
      child: Lottie.asset('assets/lotties/loan.zip'),
    );
  }
}
