import 'ItensDTO.dart';

class PedidoDTO {
  int? codigo;
  String? dataEmissao;
  String? nomeCliente;
  String? emailCliente;
  double? valorTotal;
  List<ItensDTO?> itens = List<ItensDTO?>.filled(0, null, growable: true);

  PedidoDTO(
      {this.codigo,
      this.dataEmissao,
      this.nomeCliente,
      this.emailCliente,
      this.valorTotal});

  PedidoDTO.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    dataEmissao = json['dataEmissao'];
    nomeCliente = json['nomeCliente'];
    emailCliente = json['emailCliente'];
    valorTotal = json['valorTotal'];
    if (json['itens'] != null) {
      json['itens'].forEach((v) {
        itens.add(new ItensDTO.fromJson(v));
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
    data['itens'] = this.itens.map((v) => v!.toJson()).toList();
    return data;
  }
}
