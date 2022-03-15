import 'package:bytebanktwo/database/dao/contact_dao.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final ContactDao _dao = ContactDao();
  @override
  Widget build(BuildContext context) {
    final contactArgs = ModalRoute.of(context)?.settings.arguments as Contact;
    final Contact contactNew = Contact(0, '', 0);
    return Scaffold(
      appBar: AppBar(
        title: contactArgs.id == 0
            ? const Text('Novo Contato')
            : const Text('Alterar Contato'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF283c86), Color(0xFF45a247)]
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required("Nome Obrigatório"),
                        Validatorless.min(
                            5, "Nome deve ter no mínimo 6 Caracteres")
                      ],
                    ),
                    initialValue: contactArgs.name,
                    onSaved: (value) {
                      if (contactArgs.id != 0) {
                        contactNew.id = contactArgs.id;
                        contactNew.name = value.toString();
                      } else {
                        contactNew.name = value.toString();
                      }
                    },
                    decoration:
                        const InputDecoration(labelText: 'Nome Completo'),
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required("Numero da Conta Obrigatório"),
                          Validatorless.number("Preencha o campo corretamente"),
                        ],
                      ),
                      initialValue: contactArgs.id == 0
                          ? ''
                          : contactArgs.accountNumber.toString(),
                      onSaved: (value) {
                        contactNew.accountNumber = int.tryParse(value.toString())!;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Numero da Conta'),
                      style: const TextStyle(fontSize: 24.0),
                      keyboardType: TextInputType.number),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () =>
                          _saveContact(_dao, contactNew),
                      child: const Text('Confirmar'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveContact(ContactDao dao, Contact contactNew) {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      dao.put(contactNew);
      Navigator.of(context).pop();
    }
  }
}
