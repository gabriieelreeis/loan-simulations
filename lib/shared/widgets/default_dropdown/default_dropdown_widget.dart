import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({
    Key? key,
    this.labelText,
    this.decoration,
    this.obscureText = false,
    this.hintText,
    this.onChange,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.controller,
    this.labelColor,
    this.onTap,
    this.widgetPosition = 'left',
    this.widget,
    required this.flex,
    this.inputFormatters,
    this.items,
  }) : super(key: key);

  final String? labelText;
  final InputDecoration? decoration;
  final Color? labelColor;
  final bool obscureText;
  final String? hintText;
  final void Function(String?)? onChange;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final String? widgetPosition;
  final dynamic widget;
  final int flex;
  final List<TextInputFormatter>? inputFormatters;
  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 75.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: borderInput,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widgetPosition == 'left')
                    Flexible(child: SizedBox(child: widget)),
                  Flexible(
                    flex: flex,
                    child: DropdownButtonFormField<String>(
                      onTap: onTap,
                      decoration: decoration ??
                          const InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: EdgeInsets.all(12),
                            focusColor: Colors.transparent,
                            border: InputBorder.none,
                          ),
                      value: initialValue,
                      onChanged: onChange,
                      items: items,
                    ),
                  ),
                  if (widgetPosition == 'rigth')
                    Flexible(child: SizedBox(child: widget)),
                ],
              ),
            ),
            Positioned(
              left: 14.w,
              top: 10.h,
              child: Text(
                labelText!,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
