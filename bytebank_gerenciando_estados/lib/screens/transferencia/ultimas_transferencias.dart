import 'package:bytebank_gerenciando_estados/models/transferencias.dart';
import 'package:bytebank_gerenciando_estados/screens/transferencia/item.dart';
import 'package:bytebank_gerenciando_estados/screens/transferencia/lista_transferencia.dart';
import 'package:bytebank_gerenciando_estados/screens/transferencia/sem_transferencias_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titulo = 'Utimas Transfêrencias';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final ultimasTransferencias = transferencias.transferencias.reversed
              .toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = _tamanhoTransferencia(_quantidade);
          if (_quantidade == 0){
            return const SemTransferenciaCard();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(ultimasTransferencias[indice]);
            },

          );
        }),
        ElevatedButton(
            child: const Text('Listar todas Transfêrencias'),
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ListaTransferencia();
              }));
            })
      ],
    );
  }

  _tamanhoTransferencia(quantidade) {
    int tamanho = 2;
    if (quantidade < 3) {
      tamanho = quantidade;
    }
    return tamanho;
  }
}
