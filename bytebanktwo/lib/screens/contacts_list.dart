import 'package:bytebanktwo/database/app_database.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView(children: const <Widget>[
        Card(
          child: ListTile(
            title: Text('Alexa', style: TextStyle(fontSize: 24.0)),
            subtitle: Text('100', style: TextStyle(fontSize: 16.0)),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              )
              .then(
                (newContact) => save(Contact(1, newContact.name, newContact.nConta)),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
