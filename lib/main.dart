import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/app/routes/app_pages.dart';
import 'package:loan_simulations/shared/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: ".env");

  runApp(
    ScreenUtilInit(
      designSize: const Size(392, 866),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Empresta Bem Melhor',
          theme: appThemeData,
          initialRoute: Routes.initial,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
