import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    Key? key,
    this.width,
    this.fluid = false,
    this.maxWidth = 400,
    this.title,
    this.bgColor,
    this.textColor,
    this.onTap,
    this.fontSize = 18,
    this.fontWeight,
  }) : super(key: key);

  final double? width;
  final double maxWidth;
  final bool fluid;
  final String? title;
  final Color? bgColor;
  final Color? textColor;
  final void Function()? onTap;
  final double fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            color: bgColor ?? accentColor,
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(8),
            ),
          ),
          constraints: BoxConstraints(
              maxWidth:
                  !fluid ? maxWidth.w : width ?? ScreenUtil().screenWidth.w),
          width: !fluid
              ? width ?? (ScreenUtil().screenWidth - 65).w
              : ScreenUtil().screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? 'Informe um title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize.sp,
                  color: textColor ?? primaryColor,
                  fontWeight: fontWeight ?? FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
