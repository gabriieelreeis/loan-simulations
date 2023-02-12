import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_simulations/shared/models/institution_model.dart';
import 'package:loan_simulations/shared/models/insurance_model.dart';
import 'package:loan_simulations/shared/services/institution_service.dart';
import 'package:loan_simulations/shared/services/insurance_service.dart';
import 'package:loan_simulations/shared/services/simulation_service.dart';

class SimulationController extends GetxController {
  final InstitutionService _institutionService = InstitutionService.to;
  final InsuranceService _insuranceService = InsuranceService.to;
  final SimulationService _simulationService = SimulationService.to;

  final _loading = false.obs;
  final loanValueController = TextEditingController();
  final _loanValue = 'R\$0,00'.obs;
  final _institution = <dynamic>[].obs;
  final _insurance = <dynamic>[].obs;
  final _installments = 0.obs;
  final _listInstitutions = <InstitutionModel>[].obs;
  final _listInsurances = <InsuranceModel>[].obs;
  final _result = Rxn<Map<String, dynamic>>();

  set loading(bool val) => _loading.value = val;
  bool get loading => _loading.value;

  set loanValue(val) => _loanValue.value = val != '' ? val : 'R\$0,00';
  double get loanValue {
    NumberFormat format = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

    if (_loanValue.value != 'R\$0,00') {
      return format.parse(_loanValue.value).toDouble();
    }

    return 0;
  }

  set institution(List<dynamic> val) => _institution.value = val;
  List<dynamic> get institution => _institution.value;

  set insurance(List<dynamic> val) => _insurance.value = val;
  List<dynamic> get insurance => _insurance.value;

  set installments(val) => _installments.value = int.parse(val);
  get installments => _installments.value;

  set listInstitutions(List<InstitutionModel>? val) =>
      _listInstitutions.value = val!;
  List<InstitutionModel>? get listInstitutions => _listInstitutions.value;

  set listInsurances(List<InsuranceModel>? val) => _listInsurances.value = val!;
  List<InsuranceModel>? get listInsurances => _listInsurances.value;

  set result(Map<String, dynamic>? val) => _result.value = val;
  Map<String, dynamic>? get result => _result.value;

  bool get validForm {
    if (loanValue > 0) {
      return true;
    }

    return false;
  }

  @override
  void onInit() async {
    super.onInit();

    await _init();
  }

  Future _init() async {
    loading = true;
    _listenEvents();
    await _getInstitutions();
    await _getInsurances();
    loading = false;
  }

  Future<void> simulateLoan() async {
    loading = true;

    try {
      final simulation = await _simulationService.simulate(
        loanValue,
        institution,
        insurance,
        installments,
      );

      result = simulation;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    loading = false;
  }

  void _listenEvents() {
    loanValueController.addListener(() => loanValue = loanValueController.text);
  }

  Future<void> _getInstitutions() async {
    try {
      final institutions = await _institutionService.getInstitutions();
      if (institutions != null) listInstitutions = institutions;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _getInsurances() async {
    try {
      final insurances = await _insuranceService.getInsurances();
      if (insurances != null) listInsurances = insurances;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  String convertDoubleToReal(double value) {
    final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
      locale: 'pt_BR',
      symbol: 'R\$',
    );

    return _formatter.format(value.toString());
  }

  void reset() {
    result = null;
    installments = '0';
    insurance = [];
    institution = [];
    loanValue = 'R\$0,00';
  }
}
