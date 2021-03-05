import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Telas/telaInicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(
      title: 'Aplicativo CC',
      home: ClasseTelaInicial(),
    );
  }
}
