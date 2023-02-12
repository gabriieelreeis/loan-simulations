import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double statusBarHeight = ScreenUtil().statusBarHeight;
  late final double height;

  AppBarWidget({Key? key}) : super(key: key) {
    height = (statusBarHeight + 70).h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: statusBarHeight),
      decoration: const BoxDecoration(
        color: primaryBackground,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            spreadRadius: -4,
            blurRadius: 6,
            color: shadowColor,
          ),
        ],
      ),
      child: SvgPicture.asset(
        'assets/images/svgs/logo_empresta.svg',
        height: height * .4,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
