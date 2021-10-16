import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class EditorText extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;

  const EditorText(this.controller, this.rotulo, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        validator: Validatorless.multiple([
          Validatorless.required("Nome Obrigatório"),
          Validatorless.min(6, "Nome deve ter no mínimo 6 Caracteres")
        ]),
        controller: controller,
        decoration: InputDecoration(
          labelText: rotulo,
        ),

        style: const TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}