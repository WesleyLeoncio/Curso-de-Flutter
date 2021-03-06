import 'package:bytebank_gerenciando_estados/screens/dashboard/saldo_card.dart';
import 'package:bytebank_gerenciando_estados/screens/deposito/formulario_deposito.dart';
import 'package:bytebank_gerenciando_estados/screens/transferencia/formulario_transferencia.dart';
import 'package:bytebank_gerenciando_estados/screens/transferencia/ultimas_transferencias.dart';
import 'package:flutter/material.dart';


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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    child: const Text('Receber depósito'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FormularioDeposito();
                      }));
                    }),
                ElevatedButton(
                      child: const Text('Nova transferência'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return  FormularioTransferencia();
                          }));
                    })
              ],
            ),
            const UltimasTransferencias()
          ],
        ));
  }
}
