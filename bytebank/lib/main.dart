import 'package:flutter/material.dart';
import 'screens/transferencia/lista.dart';

void main() => runApp(const BytebankApp());

////////////////////////////////////////////////////////////////////////////////
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: const ColorScheme.light()
                .copyWith(primary: Colors.green)
                .copyWith(secondary: Colors.green[300])),
        home: ListaTransferencias());
  }
}




