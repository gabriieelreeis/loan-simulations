import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DefaultMultiSelect extends StatelessWidget {
  const DefaultMultiSelect({
    Key? key,
    this.labelText,
    this.decoration,
    this.obscureText = false,
    this.hintText,
    required this.onChange,
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
  final void Function(List<dynamic>) onChange;
  final List<dynamic>? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final String? widgetPosition;
  final dynamic widget;
  final int flex;
  final List<TextInputFormatter>? inputFormatters;
  final List<dynamic>? items;

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
                    child: MultiSelectDialogField(
                      confirmText: const Text('Confirmar'),
                      cancelText: const Text('Cancelar'),
                      title: Text(hintText ?? ''),
                      selectedColor: primaryColor,
                      initialValue: initialValue ?? [],
                      selectedItemsTextStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      buttonText: Text(hintText ?? ''),
                      buttonIcon: Icon(
                        Icons.arrow_drop_down,
                        size: 20.h,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      items: items!
                          .map((e) => MultiSelectItem(e.chave, e.valor))
                          .toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: onChange,
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
