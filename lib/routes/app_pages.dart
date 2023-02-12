import 'package:get/get.dart';
import 'package:loan_simulations/app/modules/presentation/bindings/presentation_bindings.dart';
import 'package:loan_simulations/app/modules/presentation/views/presentation_view.dart';
import 'package:loan_simulations/app/modules/root/views/root_view.dart';
import 'package:loan_simulations/app/modules/simulation/bindings/simulation_binding.dart';
import 'package:loan_simulations/app/modules/simulation/views/simulation_view.dart';
import 'package:loan_simulations/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:loan_simulations/app/modules/splash_screen/views/splash_screen_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: Routes.initial,
          page: () => const SplashScreenView(),
          binding: SplashScreenBinding(),
        ),
        GetPage(
          name: Routes.presentation,
          binding: PresentationBinding(),
          page: () => const PresentationView(),
        ),
        GetPage(
          name: Routes.simulation,
          binding: SimulationBinding(),
          page: () => SimulationView(),
        ),
      ],
    ),
  ];
}
