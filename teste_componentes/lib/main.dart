import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:teste_componentes/screens/carro_tela.dart';
import 'package:teste_componentes/screens/home.dart';
import 'package:teste_componentes/screens/marca_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  int selectdedPage = 0;
  final _pageOption = const [Home(),MarcaTela(), CarroTela()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOption[selectdedPage],
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.reactCircle,
          backgroundColor: Colors.orange,
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFff8008),
                Color(0xFF403b4a),
              ]),
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.catching_pokemon, title: 'Marcas'),
            TabItem(icon: Icons.car_rental, title: 'Carros'),
          ],
          initialActiveIndex: 0,
          //optional, default as 0
          onTap: (int index) {
            setState(() {
              selectdedPage = index;
            });
          },
        ));
  }
}
