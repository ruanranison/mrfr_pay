class Extrato {
  late String nome;
  late String vencimento;
  late String valor;
  late String codigo;

  Extrato({required this.nome, required this.vencimento, required this.valor, required this.codigo});

  Extrato.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    valor = json['valor'];
    codigo = json['codigo'];
    vencimento = json['vencimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nome'] = nome;
    data['valor'] = valor;
    data['codigo'] = codigo;
    data['vencimento'] = vencimento;
    return data;
  }
}