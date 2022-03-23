import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_teste/stores/form_store/form_store.dart';
import 'package:provider/provider.dart';

class BodyWidgetForm extends StatelessWidget {
  const BodyWidgetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store= Provider.of<FormStore>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Observer(
        builder: (_) {
          return Column(
            children: <Widget>[
              _textField('Login', store.changeLogin, store.validationLogin),
              const SizedBox(height: 20),
              _textField(
                  'Password', store.changePassword, store.validationPassword),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: store.isValid ? () {
                  } : null,
                  child: const Text('Logar'))
            ],
          );
        },
      ),
    );
  }
}
_textField(String labelText, onChanged, erroText) {
  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labelText,
      errorText: erroText == null ? null : erroText(),
    ),
  );
}