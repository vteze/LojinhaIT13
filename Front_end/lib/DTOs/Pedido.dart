class Pedido {
  int? codigo;
  String? dataEmissao;
  String? nomeCliente;
  String? emailCliente;
  int? valorTotal;
  List<Itens?> itens;

 Pedido(
      {this.codigo,
      this.dataEmissao,
      this.nomeCliente,
      this.emailCliente,
      this.valorTotal,
      this.itens});

 Pedido.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    dataEmissao = json['dataEmissao'];
    nomeCliente = json['nomeCliente'];
    emailCliente = json['emailCliente'];
    valorTotal = json['valorTotal'];
    if (json['itens'] != null) {
      itens = new List<Itens>();
      json['itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['dataEmissao'] = this.dataEmissao;
    data['nomeCliente'] = this.nomeCliente;
    data['emailCliente'] = this.emailCliente;
    data['valorTotal'] = this.valorTotal;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
