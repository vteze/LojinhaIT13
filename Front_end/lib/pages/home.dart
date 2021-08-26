import 'package:flutter/material.dart';
import 'package:front_end/widgets/grid_list_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridListDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

