import 'package:flutter/material.dart';
import 'package:teste_componentes/components/menus/menu_1.dart';
import 'package:teste_componentes/components/menus/menu_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light()
            .copyWith(primary: Colors.orange)
      ),
      home: const MainAPP(),
    );
  }
}

class MainAPP extends StatefulWidget {
  const MainAPP({Key? key}) : super(key: key);

  @override
  State<MainAPP> createState() => _MainAPPState();
}

class _MainAPPState extends State<MainAPP> {


  @override
  Widget build(BuildContext context) {
    return const Menu1();
  }
}
