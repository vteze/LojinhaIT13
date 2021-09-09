class Cliente {
  int? clienteId;
  String? nome;
  String? email;
  Cliente({this.clienteId, this.nome, this.email});
  Cliente.fromJson(Map<String, dynamic> json) {
    clienteId = json['clienteId'];
    nome = json['nome'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clienteId'] = this.clienteId;
    data['nome'] = this.nome;
    data['email'] = this.email;
    return data;
  }
}