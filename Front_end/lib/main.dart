import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front_end/pages/home.dart';

// Essa é usada para desetivar a verificação do certificado ssl
// WARNING!!! usar apenas em desenvolvimento, nunca em produção.
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = new MyHttpOverrides(); // chamada da classe acima
  runApp(MyApp());
}
