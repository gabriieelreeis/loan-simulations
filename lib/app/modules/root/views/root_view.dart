import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/app/routes/app_pages.dart';

class RootView extends GetView {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.initial,
            delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
