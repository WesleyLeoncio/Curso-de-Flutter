import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/routess/app_routes.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactItem extends StatelessWidget {
  final Contact _contact;

  const ContactItem(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactListRecharge contactRecharge = context.watch<ContactListRecharge>();
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_contact.name, style: const TextStyle(fontSize: 24.0)),
        subtitle: Text(_contact.nConta.toString(),
            style: const TextStyle(fontSize: 16.0)),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.contactForm,
                    arguments: _contact,
                  );
                },
                icon: const Icon(
                  Icons.edit,
                ),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Excluir Contato'),
                      content: const Text('Deseja Ecluir ?'),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            contactRecharge.removeContact(_contact);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Sim"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Não"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
