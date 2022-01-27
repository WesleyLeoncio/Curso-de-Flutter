import 'package:bytebank_gerenciando_estados/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'formulario_transferencia.dart';
import 'item.dart';

class ListaTransferencia extends StatelessWidget{
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child){
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
          }),
    );
  }

}

