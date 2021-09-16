import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:front_end/DTOs/Product.dart';
import 'dart:convert';

void main() {
  test('Montagem de de objeto Product.dart', () {
    var jsonTeste = {
      "codigo": 5,
      "nome": "Apontador",
      "descricao": "Apontador Faber Castell (1 un)",
      "urlImagem":
          "https://images.tcdn.com.br/img/img_prod/866298/apontador_jumbo_cis_ideal_para_giz_e_lapis_jumbo_83_1_fcec333d0e11afbe926de0cda3563103.png",
      "precoUnitario": "9,50"
    };
    Product novoProduto = Product.fromJson(jsonTeste);
    expect(novoProduto.nome, equals('Apontador'));
    expect(novoProduto.precoUnitario, equals('9,50'));
  });

  var url;
  var response;
  setUp(() async {
    url = Uri.parse('https://localhost:5001/produtos/4');
    response = await http.get(url);
  });

  group('Teste de requisicao HTTP', () {
    test('Conexão com servidor OK', () {
      expect(response.statusCode, equals(200));
    });

    test('Criacao de objeto Product a partir de dados do webservice', () {
      Product produtoTeste = Product.fromJson(json.decode(response.body));
      expect(produtoTeste.codigo, 4);
      expect(produtoTeste.nome, equals('Borracha'));
      expect(produtoTeste.precoUnitario, equals('7.5'));
      // Implementar retorno de valores em string pelo webservice (backend)
      // expect(produtoTeste.precoUnitario, equals('7,50'));
    });
  });
}
