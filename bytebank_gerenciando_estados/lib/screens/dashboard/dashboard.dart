import 'package:bytebank_gerenciando_estados/models/saldo.dart';
import 'package:bytebank_gerenciando_estados/screens/dashboard/saldo_card.dart';
import 'package:bytebank_gerenciando_estados/screens/deposito/formulario_deposito.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: SaldoCard(),
            ),
            ElevatedButton(
                child: const Text('Adicionar'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                })
          ],
        ));
  }
}
