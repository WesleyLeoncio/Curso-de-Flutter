import 'package:flutter/material.dart';

class SemTransferenciaCard extends StatelessWidget {
  const SemTransferenciaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou nenhuma transfêrencia',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
