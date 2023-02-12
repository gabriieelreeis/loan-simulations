import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/models/institution_model.dart';
import 'package:loan_simulations/shared/models/insurance_model.dart';
import 'package:loan_simulations/shared/services/institution_service.dart';
import 'package:loan_simulations/shared/services/insurance_service.dart';

class SimulationController extends GetxController {
  final InstitutionService _institutionService = InstitutionService.to;
  final InsuranceService _insuranceService = InsuranceService.to;

  final _loading = false.obs;
  set loading(bool val) => _loading.value = val;
  bool get loading => _loading.value;

  final loanValueController = TextEditingController();
  final _loanValue = ''.obs;
  set loanValue(String val) => _loanValue.value = val;
  String get loanValue => _loanValue.value;

  final _institution = ''.obs;
  set institution(String val) => _institution.value = val;
  String get institution => _institution.value;

  final _insurance = ''.obs;
  set insurance(String val) => _insurance.value = val;
  String get insurance => _insurance.value;

  final _installments = ''.obs;
  set installments(String val) => _installments.value = val;
  String get installments => _installments.value;

  final _listInstitutions = Rxn<List<InstitutionModel>>();
  set listInstitutions(List<InstitutionModel>? val) =>
      _listInstitutions.value = val;
  List<InstitutionModel>? get listInstitutions => _listInstitutions.value!;

  final _listInsurances = Rxn<List<InsuranceModel>>();
  set listInsurances(List<InsuranceModel>? val) => _listInsurances.value = val;
  List<InsuranceModel>? get listInsurances => _listInsurances.value!;

  @override
  void onInit() async {
    super.onInit();

    await _init();
  }

  Future<void> simulateLoan() async {
    loading = true;
    await Future.delayed(
      const Duration(seconds: 5),
    );

    loading = false;
  }

  bool get validForm {
    if (loanValue != '') {
      return true;
    }

    return false;
  }

  Future _init() async {
    loading = true;
    _listenEvents();
    await _getInstitutions();
    await _getInsurances();
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
}
