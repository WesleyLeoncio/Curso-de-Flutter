import 'package:flutter/material.dart';

class CampoTeste extends StatefulWidget {
  const CampoTeste({Key? key}) : super(key: key);

  @override
  State<CampoTeste> createState() => _CampoTesteState();
}

class _CampoTesteState extends State<CampoTeste> {
  final nameController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Form(
        key: _fromKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value!.length < 4) {
                  return "Nome muito pequeno";
                }
              },
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var formValid = _fromKey.currentState?.validate() ?? false;
                if(formValid){

                }
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }
}
