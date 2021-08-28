import 'package:flutter/material.dart';
import 'package:front_end/widgets/grid_list_view.dart';
import 'package:front_end/widgets/custom_app_bar.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return MaterialApp(
      title: 'Lojinha',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Scaffold(
        appBar: CustomAppBar((text) => "", scaffoldKey),
        body: GridListDemo(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}