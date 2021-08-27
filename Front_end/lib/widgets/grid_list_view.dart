// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:front_end/models/photo.dart';
import 'package:front_end/widgets/product_card.dart';
import 'package:front_end/utils/array.dart' as photos;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'search_app_bar.dart';

class GridListDemo extends StatelessWidget {
  const GridListDemo({
    Key? key,
  }) : super(key: key);

  // Os widgets estão stateless, mas devem virar stateful caso precisem carregar os produtos do banco de dados

  // final GridListDemoType type;

  // Array estático de imagens apenas para teste visual
  List<Photo> _photos(BuildContext context) {
    return photos.list;
  }

  // Construção do layout do grid_list_view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Construção da barra de pesquisa com o FloatingSearchBar ( Olhar exemplo https://stackoverflow.com/questions/57740955/how-to-make-a-floating-search-bar-on-top-of-google-maps-in-flutter)
      // Completar a implementação
      // // Executar pub get para pegar a dependência do FloatingSearchBar importada (descrita no .yaml)
      appBar: FloatAppBar(),
      // WARNING: Talvez tenha que mudar o contrutor do gridView no futuro
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(16),
        childAspectRatio: 1,
        children: _photos(context).map<Widget>((photo) {
          return GridDemoPhotoItem(
            photo: photo,
          );
        }).toList(),
      ),
    );
  }
}
