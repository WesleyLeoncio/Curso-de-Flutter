import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_teste/stores/name_store/name_store.dart';

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStore = NameStore();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name mobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: nameStore.alterarName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                onChanged: nameStore.alterarSobrenome,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_){
              return Text(nameStore.nameCompleto);
            },)
          ],
        ),
      ),
    );
  }
}
