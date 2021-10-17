import 'package:bytebanktwo/controll/contact_atualiza.dart';
import 'package:bytebanktwo/model/contact.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactItem extends StatelessWidget {
  final Contact _contact;
  const ContactItem(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var contacts = Provider.of<ContactAtualiza>(context);
    var contAtualiza = context.watch<ContactAtualiza>();
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
                onPressed: () {},
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
                            contAtualiza.remove(_contact);
                            //contAtualiza.notifyListeners();
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
