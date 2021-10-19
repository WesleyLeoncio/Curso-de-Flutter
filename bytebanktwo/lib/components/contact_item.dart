import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/routess/app_routes.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ContactItem extends StatelessWidget {
  final Contact _contact;

  const ContactItem(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactListRecharge contactRecharge = context.watch<ContactListRecharge>();
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      closeOnScroll: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor: Colors.green[50],
          leading: const Icon(Icons.monetization_on, color: Colors.green,),
          title: Text(_contact.name, style: const TextStyle(fontSize: 20.0)),
          subtitle: Text(_contact.nConta.toString(),
              style: const TextStyle(fontSize: 16.0)),
          trailing: const Icon(Icons.touch_app_outlined, color: Colors.green,),

        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.deepOrange[400],
          icon: Icons.edit, foregroundColor: Colors.white,
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.contactForm,
              arguments: _contact,
            );
          },
        ),
        IconSlideAction(
          caption: 'Deletar',
          color: Colors.red[400],
          icon: Icons.delete,
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Excluir Contato'),
                content: const Text('Tem Certeza que deseja Excluir?'),
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
        ),
      ],
    );
  }
}
