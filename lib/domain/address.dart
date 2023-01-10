class Address {
    late String cep;
    late String logradouro;
    late String complemento;
    late String bairro;
    late String localidade;
    late String uf;
    late String ddd;
  

  Address({ this.cep ='',  this.logradouro ='',  this.complemento ='',  this.bairro ='',  this.localidade ='',  this.uf ='',  this.ddd =''});

  Address.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ddd'] = ddd;
    return data;
  }


}