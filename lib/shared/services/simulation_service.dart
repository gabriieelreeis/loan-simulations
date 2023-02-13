import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:uno/uno.dart';

class SimulationService extends GetxService {
  static SimulationService get to => Get.find<SimulationService>();

  final uno = Uno();
  final String _url = '${dotenv.env['API_URL']}/simular';

  Future<Map<String, dynamic>?> simulate(
    double value, [
    List<dynamic>? institutions,
    List<dynamic>? insurances,
    int? installments,
  ]) async {
    try {
      final Map<String, dynamic> data = {
        "valor_emprestimo": value,
        "instituicoes": institutions,
        "convenios": insurances,
        "parcelas": installments
      };

      final response = await uno.post(
        _url,
        headers: {'Content-Type': 'application/json'},
        data: jsonEncode(data),
      );

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }
}
