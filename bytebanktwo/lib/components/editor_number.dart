import 'package:flutter/material.dart';

class EditorNumber extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;

  const EditorNumber(this.controller, this.rotulo, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
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