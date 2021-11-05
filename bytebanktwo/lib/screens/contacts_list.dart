import 'package:bytebanktwo/components/mensage/centered_message.dart';
import 'package:bytebanktwo/components/contact_item.dart';
import 'package:bytebanktwo/components/progress.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/routes/app_routes.dart';
import 'package:bytebanktwo/screens/transaction_form.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    ContactListRecharge contactRecharge = context.watch<ContactListRecharge>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF283c86), Color(0xFF45a247)]),
          ),
        ),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: contactRecharge.getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting: // load
              return const Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              if (contacts!.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return ContactItem(
                      contact,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ));
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
              }
              return const CenteredMessage('Lista Vazia', icon: Icons.warning);
          }
          return const CenteredMessage('Erro na api de arquivos :(',
              icon: Icons.error);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.contactForm,
            arguments: Contact(0, '', 0),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
