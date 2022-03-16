
import 'package:bytebanktwo/components/mensage/response_dialog.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message = 'Transação efetuada com sucesso!';
  final IconData icon;

  const SuccessDialog(
       {Key? key,
        this.title = 'Success',
        this.icon = Icons.done,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      colorIcon: Colors.green,
    );
  }
}

