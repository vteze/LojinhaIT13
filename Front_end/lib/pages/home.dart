import 'package:flutter/material.dart';
/* import 'package:front_end/widgets/grid_list_view.dart';
import 'package:front_end/widgets/custom_app_bar.dart'; */
import 'package:front_end/pages/user_authentication.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return MaterialApp(
      title: 'Lojinha',
      theme: ThemeData(
        primaryColor: Color(0xff170337),
        primaryColorLight: Color(0xff821E64),
        accentColor: Color(0xffDC2B50),
        highlightColor: Color(0xffFA5A0A),
        backgroundColor: Color(0xffF5F5F5) // Nao esta na paleta
      ),
      home: Scaffold(
        body: const Center(
          child: UserAuthentication(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}