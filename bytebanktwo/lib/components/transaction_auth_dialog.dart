import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  const TransactionAuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Authenticate',
        style: TextStyle(color: Color(0xFF33691E)),
      ),
      content: const TextField(
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(
            fontSize: 65, letterSpacing: 32, color: Color(0xFF7CB342)),
        keyboardType: TextInputType.number,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            debugPrint('Cancelar');
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Color(0xFF33691E),
                fontSize: 16
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            debugPrint('Confirmar');
          },
          child: const Text('Confirmar',
              style: TextStyle(
                color: Color(0xFF33691E),
                fontSize: 16
              )),
        ),
      ],
    );
  }
}
