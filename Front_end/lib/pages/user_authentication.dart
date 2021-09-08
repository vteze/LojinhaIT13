import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:front_end/widgets/grid_list_view.dart';
// import 'package:front_end/models/photo.dart' as photos;
import 'package:front_end/DTOs/cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:front_end/DTOs/pedido.dart';

class UserAuthentication extends StatefulWidget {
  const UserAuthentication({Key? key}) : super(key: key);
  @override
  State<UserAuthentication> createState() => _UserAuthentication();
}

class _UserAuthentication extends State<UserAuthentication> {
  String valorString = 'Usuário';
  bool isSelected = false;
  int? idCliente;
  var _carrinhoId;
  var _clientes = List<Cliente>.empty(growable: true);

  // DISCUTIR COM O PESSOAL A POSSIVEL REMOÇÃO POIS TALVEZ SEJA INUTIL
  List<Cliente> _clienteListBuilder(BuildContext context) {
    return _clientes;
  }

  Future<List<Cliente>> getCliente() async {
    // o local host do android e do pc são diferentes. Esse é o ip padrao do android emulator
    var url = Uri.parse('https://10.0.2.2:5001/clientes');
    var clientes = List<Cliente>.empty(growable: true);
    var response = await http.get(url);
    var clienteList = json.decode(response.body);
    for (Map<String, dynamic> cliente in clienteList) {
      clientes.add(Cliente.fromJson(cliente));
    }
    return clientes;
  }

  Future<Pedido> getCarrinhoCliente() async {
    var url = Uri.parse('https://10.0.2.2:5001/clientes/${idCliente}');
    var response = await http.get(url);
    var pedido = json.decode(response.body);
    return Pedido.fromJson(pedido);
  }

  @override
  void initState() {
    super.initState();
    getCliente().then((var clientes) => setState(() {
          _clientes = clientes;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(

            // Widgets organizados em uma coluna
            children: [
              // Texto "Lojinha"
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text("Lojinha",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            )),
                      ))),

              // Coluna que armazenada o Texto e o Dropdown
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Selecione o usuário",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 23),
                              textAlign: TextAlign.left),
                          // DropdownButton
                          Padding(
                            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: DropdownButton(
                              hint: Text(
                                valorString,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black), // Cor do texto
                              // Underline do Widget
                              underline: Container(
                                height: 1,
                                color: Colors.black, // Cor do underline
                              ),

                              /* Quando o usuário clica em um item da lista (novoValor),
                  o valorString (string que fica no widget) muda para a novoValor. */
                              onChanged: (Cliente? novoValor) {
                                setState(() {
                                  idCliente = novoValor!.clienteId;
                                  isSelected = true;
                                  valorString = novoValor!
                                      .nome!; // onChanged recebe uma String?, por isso '!' acompanha novoValor
                                });
                              },

                              // Sistema de listagem dos usuários (obs: sinto que poderiamos estudar sobre)
                              items: _clientes.map<DropdownMenuItem<Cliente>>(
                                  (Cliente value) {
                                return DropdownMenuItem<Cliente>(
                                    value: value,
                                    child: Text(value.nome!,
                                        style: TextStyle(color: Colors.black)));
                              }).toList(),
                            ),
                          ),
                        ],
                      ))),

              Expanded(
                  flex: 3,
                  child: Image(
                      image: AssetImage("images/ratinho.png"),
                      color: !isSelected
                          ? Colors.grey
                          : Theme.of(context).accentColor,
                      height: 350,
                      width: 350)),

              // Botão Entrar
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 60,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: !isSelected
                              ? null
                              : () => {
                                    getCarrinhoCliente().then(
                                      (var pedido) {
                                        setState(() {
                                          _carrinhoId = pedido.codigo;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GridListView(
                                                      carrinhoId: _carrinhoId,
                                                      // PASSAR PARA O GRIDVIEW OS DADOS DO PEDIDODTO
                                                    )));
                                      },
                                    ),
                                    // REQUISIÇÃO PARA PUXAR O CARRINHO A PARTIR DA VARIAVEL IDCLIENTE
                                  },
                          child: Text("Entrar",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  !isSelected
                                      ? Colors.grey
                                      : Theme.of(context).accentColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(
                                          color: !isSelected
                                              ? Colors.grey
                                              : Theme.of(context)
                                                  .accentColor)))))))
            ]));
  }
}