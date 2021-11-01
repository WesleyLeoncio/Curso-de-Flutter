import 'package:flutter/material.dart';
import 'package:teste_componentes/model/veiculo.dart';

class ReceitaInfo extends StatelessWidget {
  final Veiculo _veiculo;
  final int _index;

  const ReceitaInfo(this._veiculo, this._index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Receita')),
      body: ListView(
        children: [
          const SizedBox(height: 8.0),
          Hero(
            tag: _veiculo.imagem + "$_index",
            child: Container(
              height: 250.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      _veiculo.imagem,
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Center(
            child: Text(
              _veiculo.modelo.nomeModelo.toString(),
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}