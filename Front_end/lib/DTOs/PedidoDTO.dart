import 'ItensDTO.dart';

class PedidoDTO {
  int? codigo;
  String? dataEmissao;
  String? nomeCliente;
  String? emailCliente;
  double? valorTotal;
  List<ItensDTO?>? itens;

  PedidoDTO(
      {this.codigo,
      this.dataEmissao,
      this.nomeCliente,
      this.emailCliente,
      this.valorTotal,
      this.itens});

  PedidoDTO.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    dataEmissao = json['dataEmissao'];
    nomeCliente = json['nomeCliente'];
    emailCliente = json['emailCliente'];
    valorTotal = json['valorTotal'];
    if (json['itens'] != null) {
      // ignore: deprecated_member_use
      itens = new List<ItensDTO?>.filled(1, null, growable: true);
      json['itens'].forEach((v) {
        itens?.add(new ItensDTO.fromJson(v));
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
      data['itens'] = this.itens!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}
