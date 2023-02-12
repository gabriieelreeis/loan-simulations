import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:loan_simulations/shared/models/institution_model.dart';
import 'package:uno/uno.dart';

class InstitutionService extends GetxService {
  static InstitutionService get to => Get.find<InstitutionService>();
  final uno = Uno();
  final String _url = '${dotenv.env['API_URL']}/instituicao';

  Future<List<InstitutionModel>?> getInstitutions() async {
    try {
      final response = await uno.get(_url);
      final data = response.data;

      return List<InstitutionModel>.from(
        data.map(
          (item) => InstitutionModel.fromJson(item),
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
