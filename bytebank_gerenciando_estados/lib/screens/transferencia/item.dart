import 'package:bytebank_gerenciando_estados/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor(), style: const TextStyle(fontSize: 24),),
        subtitle: Text(_transferencia.toStringConta(), style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}