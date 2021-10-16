import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class EditorNumber extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;

  const EditorNumber(this.controller, this.rotulo, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        validator: Validatorless.multiple([ // responsavel pelas validações
          Validatorless.required("Numero da Conta Obrigatório"),
           Validatorless.number("Preencha o campo corretamente"),
        ]),
        controller: controller,
        decoration: InputDecoration(
          labelText: rotulo,
        ),
        style: const TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}