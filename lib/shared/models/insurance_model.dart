class InsuranceModel {
  late final String chave;
  late final String valor;

  InsuranceModel({required this.chave, required this.valor});

  InsuranceModel.fromJson(Map<String, dynamic> json) {
    chave = json['chave'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chave'] = chave;
    data['valor'] = valor;
    return data;
  }
}
