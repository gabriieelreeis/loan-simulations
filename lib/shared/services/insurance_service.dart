import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/models/insurance_model.dart';
import 'package:uno/uno.dart';

class InsuranceService extends GetxService {
  static InsuranceService get to => Get.find<InsuranceService>();
  final uno = Uno();
  final String _url = '${dotenv.env['API_URL']}/convenio';

  Future<List<InsuranceModel>?> getInsurances() async {
    try {
      final response = await uno.get(_url);
      final data = response.data;

      return List<InsuranceModel>.from(
        data.map(
          (item) => InsuranceModel.fromJson(item),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }
}
