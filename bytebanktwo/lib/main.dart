import 'package:bytebanktwo/controll/contact_atualiza.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactAtualiza(), child: const ByteBankAppTwo()));
}

class ByteBankAppTwo extends StatelessWidget {
  const ByteBankAppTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light()
              .copyWith(primary: Colors.green[900])
              .copyWith(secondary: Colors.green[700])),
      home: const Dashboard(),
    );
  }
}
