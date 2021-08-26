// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class GridListDemo extends StatelessWidget {
  const GridListDemo({
    Key? key,
    /* required type*/
  }) : super(key: key);

  // Se forem usar o widget gridView, podem retirar tudo que está relacionado a type e tileStyle.
  // Essas duas variaveis seriam usadas para escolher 1 entre 3 estilos para as imagens do gridView
  // Porém esse app acredito que vamos usar apenas 1 estilo(caso usam o gridView). o widget comentado
  // no final do código que carrega a lógica de escolher o tileStyle.

  // Os widgets estão stateless, mas devem virar stateful caso precisem carregar os produtos do banco de dados

  // final GridListDemoType type;

  // Array estático de imagens apenas para teste visual
  List<_Photo> _photos(BuildContext context) {
    return [
      _Photo(
        assetName: 'assets/test.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName:
            'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
    ];
  }

  // Construção do layout do grid_list_view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Lojinha"),
      ),
      // WARNING: Talvez tenha que mudar o contrutor do gridView no futuro
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(15),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return _GridDemoPhotoItem(
            photo: photo,
            //tileStyle: type,
          );
        }).toList(),
      ),
    );
  }
}

class _Photo {
  _Photo({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;
}

// Permite que o header/footer dentro das imagens se alinhe de acordo
// com o espaço relativo da imagem. Só é chamado nos tipos header e footer.
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

// Constrói as imagens do gridView
class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    Key? key,
    required this.photo,
    // required this.tileStyle,
  }) : super(key: key);

  final _Photo photo;
  // final GridListDemoType tileStyle;

  // dica 1 - usar Ctrl + . este comando "envolve" um conjunto de código por um widget

  // Inserimos nome do produto e valor
  // Inserimos botão para adicionar ao carrinho
  // Ajustamos o container e espaçamentos
  // TO-DO: resolver o overflow que está acontecendo com o texto e botão
  // TO-DO: Ajustar a cor e bordas do container

  @override
  Widget build(BuildContext context) {
    final Widget tile = Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("images/teste.jpg", fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nome do produto"),
                      Text("Valor"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Icon(Icons.shopping_cart),
                  )
                ],
              )
            ],
          ),
        ));
    //print(photo.assetName);
    return tile;
  }
}
