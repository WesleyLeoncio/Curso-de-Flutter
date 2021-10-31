import 'package:flutter/material.dart';
import 'package:teste_componentes/screens/carro_tela.dart';
import 'package:teste_componentes/screens/home.dart';
import 'package:teste_componentes/screens/marca_tela.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Menu1 extends StatefulWidget {
  const Menu1({Key? key}) : super(key: key);

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
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
                Color(0xFFfc4a1a),
                Color(0xFFf7b733),
              ]),
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.catching_pokemon, title: 'Marcas'),
            TabItem(icon: Icons.car_rental, title: 'Carros'),
          ],color: Colors.white,
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
