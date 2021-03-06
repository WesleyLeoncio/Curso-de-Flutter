import 'package:bytebank_gerenciando_estados/models/saldo.dart';
import 'package:bytebank_gerenciando_estados/models/transferencias.dart';
import 'package:bytebank_gerenciando_estados/screens/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Saldo(0)),
        ChangeNotifierProvider(create: (context)=> Transferencias())
      ],
      child: const BytebankApp(),
    ));

////////////////////////////////////////////////////////////////////////////////
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme:
                const ColorScheme.light().copyWith(primary: Colors.green[900])),
        home: const Dashboard());
  }
}
