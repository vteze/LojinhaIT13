import 'package:flutter/material.dart';
// import 'package:front_end/models/photo.dart' as photos;

class UserAuthentication extends StatefulWidget {
  const UserAuthentication({Key? key}) : super(key: key);

  @override
  State<UserAuthentication> createState() => _UserAuthentication();

}

class _UserAuthentication extends State<UserAuthentication> {

  String valorString = 'Usuário';

  @override
  Widget build(BuildContext context) {

    return Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        // Widgets organizados em uma coluna
        children: [
          
          // Texto "Lojinha"
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Text("Lojinha", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
          ),
          
          // Texto "Selecione o usuário"
          Text("Selecione o usuário", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500), textAlign: TextAlign.left),
          
          // Container do DropdownButton (apenas para definir a width)
          Container(

              width: 220,

              // DropdownButton
              child: DropdownButton<String>(
                hint: Text(
                            valorString,
                            style: TextStyle(color: Colors.black),
                          ),      
                
                icon: const Icon(Icons.person),
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
                onChanged: (String? novoValor) {
                  
                  setState(() {
                    
                    valorString = novoValor!;  // onChanged recebe uma String?, por isso '!' acompanha novoValor
                    
                  });

                },
                
                // Sistema de listagem dos usuários (obs: sinto que poderiamos estudar sobre)
                items: <String>['Usuário 1', 'Usuário 2', 'Usuário 3', 'Usuário 4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
          ),

          // Botão Entrar
          Padding(
            
            padding: const EdgeInsets.only(top: 60.0),
            
            child: Container( // Container para dar tamanho ao botão.
              
              width: 300,
              height: 40,
              
              // Botão
              child: TextButton(
                
                onPressed: () => print("Is there anybody out there ?"),

                child: Text("Entrar", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
                
                style: ButtonStyle(
                  
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
                  
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Theme.of(context).accentColor)
                    )
                  )

                ),

              ),
            ),
          )
        ],
    );
  }
}


/*class UserAuthentication extends StatelessWidget {
  const UserAuthentication({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Lojinha"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              MaterialButton(
                
                onPressed: () => print("A"), 
                child: Material(
                  elevation: 5, 
                  // child: Icon(Icons.zoom_out)
                ), 
                color: Colors.black, 
                shape: CircleBorder(),
                
                ),
              MaterialButton(
                onPressed: () => print("A"),
                
                child: Material(
                  elevation: 5,
                  // child: Icon(Icons.zoom_out)
                ), 
                color: Colors.black, 
                shape: CircleBorder(),
                ),            ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               MaterialButton(
                onPressed: () => print("A"), 
                child: Material(
                  elevation: 5, 
                  // child: Icon(Icons.zoom_out)
                ), 
                color: Colors.black, 
                shape: CircleBorder(),
                
                ),
                MaterialButton(
                onPressed: () => print("A"), 
                child: Material(
                  elevation: 5, 
                  // child: Icon(Icons.zoom_out)
                ), 
                color: Colors.black, 
                shape: CircleBorder(),
                
                ),
              ],)
          ],
        ),
      ),
    );
  }
}*/