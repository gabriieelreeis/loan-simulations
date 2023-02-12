import 'package:get/get.dart';
import 'package:loan_simulations/app/modules/simulation/controllers/simulation_controller.dart';
import 'package:loan_simulations/shared/services/institution_service.dart';
import 'package:loan_simulations/shared/services/insurance_service.dart';

class SimulationBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put<InstitutionService>(InstitutionService()),
      Bind.put<InsuranceService>(InsuranceService()),
      Bind.put<SimulationController>(SimulationController()),
    ];
  }
}
