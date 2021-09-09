class Pedido {
  int? codigo;
  String? dataEmissao;
  int? clienteId;
  String? nomeCliente;
  String? emailCliente;
  int? valorTotal;
  List<Itens?>? itens;

  Pedido(
      {this.codigo,
      this.dataEmissao,
      this.clienteId,
      this.nomeCliente,
      this.emailCliente,
      this.valorTotal,
      this.itens});

  Pedido.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    dataEmissao = json['dataEmissao'];
    clienteId = json['clienteId'];
    nomeCliente = json['nomeCliente'];
    emailCliente = json['emailCliente'];
    valorTotal = json['valorTotal'];
    if (json['itens'] != null) {
      itens = <Itens>[];
      json['itens'].forEach((v) {
        itens!.add(new Itens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['dataEmissao'] = this.dataEmissao;
    data['clienteId'] = this.clienteId;
    data['nomeCliente'] = this.nomeCliente;
    data['emailCliente'] = this.emailCliente;
    data['valorTotal'] = this.valorTotal;
    if (this.itens != null) {
      data['itens'] = this.itens!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}

class Itens {
  int? codigoProduto;
  String? nomeProduto;
  int? quantidade;
  int? precoUnitario;
  String? urlImagem;
  String? descricao;

  Itens(
      {this.codigoProduto,
      this.nomeProduto,
      this.quantidade,
      this.precoUnitario,
      this.urlImagem,
      this.descricao});

  Itens.fromJson(Map<String, dynamic> json) {
    codigoProduto = json['codigoProduto'];
    nomeProduto = json['nomeProduto'];
    quantidade = json['quantidade'];
    precoUnitario = json['precoUnitario'];
    urlImagem = json['urlImagem'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoProduto'] = this.codigoProduto;
    data['nomeProduto'] = this.nomeProduto;
    data['quantidade'] = this.quantidade;
    data['precoUnitario'] = this.precoUnitario;
    data['urlImagem'] = this.urlImagem;
    data['descricao'] = this.descricao;
    return data;
  }
}
