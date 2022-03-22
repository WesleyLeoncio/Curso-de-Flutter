import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_teste/stores/form_store/form_store.dart';

class FormTeste extends StatelessWidget {
  const FormTeste({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final store = FormStore();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
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
                    onPressed: store.isValid ? () {} : null,
                    child: const Text('Logar'))
              ],
            );
          },
        ),
      ),
    );
  }
}
