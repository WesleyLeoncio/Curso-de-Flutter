import 'package:bytebank_gerenciando_estados/screens/dashboard/saldo_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: const Align(
        alignment: Alignment.topCenter,
        child: SaldoCard(),
      ),
    );
  }
}
