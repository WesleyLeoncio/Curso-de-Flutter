import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc/src/modules/transaction/controller/transaction/controller_transaction.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Color colorIcon;

  const ResponseDialog({
    Key? key,
    this.title = "",
    this.message = "",
    required this.icon,
    this.buttonText = 'Tentar Novamente',
    this.colorIcon = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ControllerTransaction>();
    return AlertDialog(
      title: Visibility(
        child: Text(title),
        visible: title.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(
                icon,
                size: 64,
                color: colorIcon,
              ),
            ),
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () => {controller.fillTransaction()},
        )
      ],
    );
  }
}
