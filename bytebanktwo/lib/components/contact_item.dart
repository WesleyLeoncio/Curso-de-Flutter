import 'package:bytebanktwo/model/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact _contact;

  const ContactItem(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_contact.name, style: const TextStyle(fontSize: 24.0)),
        subtitle: Text(_contact.nConta.toString(),
            style: const TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
