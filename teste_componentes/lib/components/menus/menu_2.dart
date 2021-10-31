import 'package:flutter/material.dart';
import 'package:teste_componentes/screens/carro_tela.dart';
import 'package:teste_componentes/screens/home.dart';
import 'package:teste_componentes/screens/marca_tela.dart';

class Menu2 extends StatefulWidget {
  const Menu2({Key? key}) : super(key: key);

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  int selectdedPage = 0;
  final _pageOption = const [Home(), MarcaTela(), CarroTela()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption.elementAt(selectdedPage),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: selectdedPage, // pagina inicial
        /// style
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange[300],
        showUnselectedLabels: false,
        //showSelectedLabels: false,
        iconSize: 30,
        ///////////////////////////////////
        onTap: (int index) {
          setState(() {
            selectdedPage = index;
          });
        },
      ),
    );
  }
}
