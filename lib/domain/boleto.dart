class Boleto {
  late String nome;
  late String? vencimento;
  late double valor;
  late String codigo;

  Boleto({required this.nome, this.vencimento, required this.valor, required this.codigo});

  Boleto.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    valor = json['valor'];
    codigo = json['codigo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['valor'] = valor;
    data['codigo'] = codigo;
    return data;
  }


}

