import 'package:flutter/material.dart';
import 'package:teste_componentes/components/centered_message.dart';

class MarcaTela extends StatefulWidget {
  const MarcaTela({Key? key}) : super(key: key);

  @override
  State<MarcaTela> createState() => _MarcaTelaState();
}

class _MarcaTelaState extends State<MarcaTela> {
  // final MarcaionWebClient _webclient = MarcaionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marca'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF8a2387),
                  Color(0xFFf27121),
                  Color(0xFFe94057)
                ]),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CenteredMessage(
            message: 'Tempo Limite Excedido ;(',
            icon: Icons.error_outline,
            colorIcon: Colors.orange,
          )
        ],
      ),
    );
  }
}
