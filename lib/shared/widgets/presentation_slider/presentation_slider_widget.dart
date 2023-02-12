import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/theme/app_colors.dart';
import 'package:loan_simulations/shared/widgets/presentation_slider/presentation_slider_controller.dart';

class PresentationSliderWidget extends GetView<PresentationSliderController> {
  final List<dynamic> items;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final Widget? customFullNextButton;
  final Widget? customLastItemButton;
  final Color? dotsColor;

  const PresentationSliderWidget({
    Key? key,
    required this.items,
    this.physics,
    this.scrollDirection = Axis.horizontal,
    this.customFullNextButton,
    this.customLastItemButton,
    this.dotsColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: controller.initialPage);

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: items.length,
            physics: physics,
            scrollDirection: scrollDirection,
            onPageChanged: (index) => {
              controller.initialPage = index,
              controller.lastIndex = index == items.length - 1
            },
            itemBuilder: ((context, index) {
              return items[index];
            }),
          ),
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  items.length,
                  (index) => Obx(
                    () => AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: index == controller.initialPage
                            ? dotsColor ?? primaryColor
                            : dotsColor?.withOpacity(0.5) ??
                                accentColor.withOpacity(0.5),
                      ),
                      height: 10,
                      width: index == controller.initialPage ? 10 * 2.5 : 10,
                      duration: const Duration(milliseconds: 350),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: primaryBackground,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    if (!controller.lastIndex) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: !controller.lastIndex
                      ? customFullNextButton
                      : customLastItemButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
