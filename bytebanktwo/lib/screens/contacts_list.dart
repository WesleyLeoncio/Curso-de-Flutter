import 'package:bytebanktwo/components/contact_item.dart';
import 'package:bytebanktwo/controll/contact_atualiza.dart';
import 'package:bytebanktwo/database/dao/contact_dao.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    var contAtualiza = context.watch<ContactAtualiza>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: contAtualiza.getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting: // load
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts![index];
                  return ContactItem(contact);
                },
                itemCount: contacts!.length,
              );
          }
          return const Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          ).then((value) => setState((){})); // Atualiza os dados quando é salvo
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
