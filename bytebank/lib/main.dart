import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: const ListaTransferencia(),
        appBar: AppBar(
          title: const Text("Transferências"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    ));

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(1000,1000)),
        ItemTransferencia(Transferencia(2000,2000)),
        ItemTransferencia(Transferencia(3000,3000)),
        ItemTransferencia(Transferencia(4000,4000)),
        ItemTransferencia(Transferencia(5000,5000)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

   final Transferencia _transferencia;

   const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.nConta.toString()),
      ),
    );
  }

}


class Transferencia {
  final double valor;
  final int nConta;

  Transferencia(this.valor, this.nConta);
}
