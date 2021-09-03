import 'package:flutter/material.dart';
import 'package:front_end/widgets/grid_list_view.dart';
// import 'package:front_end/models/photo.dart' as photos;
import 'package:front_end/DTOs/cliente.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserAuthentication extends StatefulWidget {
  const UserAuthentication({Key? key}) : super(key: key);
  @override
  State<UserAuthentication> createState() => _UserAuthentication();
}
class _UserAuthentication extends State<UserAuthentication> {
  String valorString = 'Usuário';
  bool isSelected = false;
  var _clientes = List<Cliente>.empty(growable: true);
  List<Cliente> _clienteListBuilder(BuildContext context) {
    return _clientes;
  }
  var resposta;
  Future<List<Cliente>> getCliente() async {
    // o local host do android e do pc são diferentes. Esse é o ip padrao do android emulator
    var url = Uri.parse('https://10.0.2.2:5001/clientes');
    var clientes = List<Cliente>.empty(growable: true);
    var response = await http.get(url);
    resposta = (response.statusCode);
    var clienteList = json.decode(response.body);
    for (Map<String, dynamic> cliente in clienteList) {
      clientes.add(Cliente.fromJson(cliente));
    }
    return clientes;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      // Widgets organizados em uma coluna
      children: [
        
        // Texto "Lojinha"
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 40, 0, 0),
          child: Text(
            "Lojinha",
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.w600),
          ),
        ),

        // Coluna que armazenada o Texto e o Dropdown
        Padding(

          padding: const EdgeInsets.fromLTRB(35, 150, 0, 325),
            
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Texto "Selecione o usuário"
              Text("Selecione o usuário",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left),
              
              // Container do DropdownButton (apenas para definir a width)
              Container(

                  width: 300,
                  
                  child: DropdownButton<Cliente>(
                    hint: Text(
                      valorString,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(color: Colors.black), // Cor do texto
                    
                    // Underline do Widget
                    underline: Container(
                      height: 1,
                      color: Theme.of(context).primaryColor, // Cor do underline
                    ),

                    /* Quando o usuário clica em um item da lista (novoValor),
                               o valorString (string que fica no widget) muda para a novoValor. */
                    onChanged: (Cliente? novoValor) {
                      setState(() {
                        isSelected = true;
                        valorString = novoValor!.nome!; // onChanged recebe uma String?, por isso '!' acompanha novoValor
                      });
                    },
                    
                    // Sistema de listagem dos usuários (obs: sinto que poderiamos estudar sobre)
                    items: _clienteListBuilder(context) // <String>['Usuário 1', 'Usuário 2', 'Usuário 3', 'Usuário 4']
                        .map<DropdownMenuItem<Cliente>>((Cliente value) {
                      return DropdownMenuItem<Cliente>(
                        value: value,
                        child: Text(value.nome!),
                      );
                    }).toList(),
                  ),
              ),
            ]),
        ),
        
        Container(

            width: double.infinity,
            height: 80,

            // Botão Entrar
            child: TextButton(
              onPressed: !isSelected
                  ? null
                  : () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GridListView())),

              child: Text("Entrar",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white)),

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(!isSelected
                      ? Colors.grey
                      : Theme.of(context).accentColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(
                              color: !isSelected
                                  ? Colors.grey
                                  : Theme.of(context).accentColor)))),
            ),
          ),
      ],
    );
  }
}