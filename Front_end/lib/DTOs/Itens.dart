class Itens {
  int? codigoProduto;
  String? nomeProduto;
  int? quantidade;
  double? precoUnitario;
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
