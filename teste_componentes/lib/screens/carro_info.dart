
import 'package:flutter/material.dart';
import 'package:teste_componentes/model/veiculo.dart';

class CarroInfo extends StatelessWidget {
  final Veiculo veiculo;

  const CarroInfo(this.veiculo,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações Carro'),
      ),
      body: Center(
        child: Text(veiculo.modelo.nomeModelo),
      ),
    );
  }
}
