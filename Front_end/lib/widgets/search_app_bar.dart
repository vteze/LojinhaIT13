import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      margins: EdgeInsets.all(0), // Retirado os paddings externos do campo de busca
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.green,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
