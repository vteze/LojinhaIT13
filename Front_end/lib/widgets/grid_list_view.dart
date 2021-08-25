// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class GridListDemo extends StatelessWidget {
  const GridListDemo({Key? key}) : super(key: key);

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
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
        title: "teste title",
        subtitle: "teste subtitle",
      ),
      _Photo(
        assetName: 'https://www.eusemfronteiras.com.br/wp-content/uploads/2018/09/42159296_s-810x538.jpg',
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
      // WARNING: Talvez tha de pudar o contrutor do gridView
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return _GridDemoPhotoItem(
            photo: photo,
            // tileStyle: type,
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

// Permite que o texto dentro das imagens se alinhe de maneira correta de acordo
// com o espaço. Não funciona com o tipo imageOnly na declaração do tipo do widget
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

// Constrói as imagens
class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    Key? key,
    required this.photo,
    // required this.tileStyle,
  }) : super(key: key);

  final _Photo photo;
  // final GridListDemoType tileStyle;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "images/teste.jpg",
        fit: BoxFit.cover,
      ),
    );
    print(photo.assetName);
    return image;

    // O código abaixo seria para escolher o tipo da imagem na declaração do widget
    // grid_list_viwe, tendo os tipos: iageOnly, header, footer.

    // switch (tileStyle) {
      // case GridListDemoType.imageOnly:
        // return image;
      // case GridListDemoType.header:
      //   return GridTile(
      //     header: Material(
      //       color: Colors.transparent,
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      //       ),
      //       clipBehavior: Clip.antiAlias,
      //       child: GridTileBar(
      //         title: _GridTitleText(photo.title),
      //         backgroundColor: Colors.black45,
      //       ),
      //     ),
      //     child: image,
      //   );
      // case GridListDemoType.footer:
      //   return GridTile(
      //     footer: Material(
      //       color: Colors.transparent,
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
      //       ),
      //       clipBehavior: Clip.antiAlias,
      //       child: GridTileBar(
      //         backgroundColor: Colors.black45,
      //         title: _GridTitleText(photo.title),
      //         subtitle: _GridTitleText(photo.subtitle),
      //       ),
      //     ),
      //     child: image,
      //   );
    // return null;
  }
}

