import 'package:bytebank_gerenciando_estados/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';
import 'item.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

////////////////////////////////////////////////////////////////////////////////
class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FormularioTransferencia();
            })).then((transferencia) => _atualiza(transferencia));
          }),
    );
  }
  void _atualiza(Transferencia transferencia){
    setState(() {
      widget._transferencias.add(transferencia);
    });
  }
}

