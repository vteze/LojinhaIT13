class Product {
  String? codigo;
  String? nome;
  String? descricao;
  String? urlImagem;
  String? precoUnitario;

  Product(
      {this.codigo,
      this.nome,
      this.descricao,
      this.urlImagem,
      this.precoUnitario});

  Product.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'].toString();
    nome = json['nome'];
    descricao = json['descricao'];
    urlImagem = json['urlImagem'];
    precoUnitario = json['precoUnitario'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['urlImagem'] = this.urlImagem;
    data['precoUnitario'] = this.precoUnitario;
    return data;
  }
}