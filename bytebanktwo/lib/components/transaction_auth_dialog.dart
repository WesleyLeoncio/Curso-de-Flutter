import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {

  final Function(String password)onConfirm;

  const TransactionAuthDialog({Key? key,required this.onConfirm}) : super(key: key);
  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Authenticate',
        style: TextStyle(color: Color(0xFF33691E)),
      ),
      content:  TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        style: const TextStyle(
            fontSize: 65, letterSpacing: 24, color: Color(0xFF7CB342)),
        keyboardType: TextInputType.number,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
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
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
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
