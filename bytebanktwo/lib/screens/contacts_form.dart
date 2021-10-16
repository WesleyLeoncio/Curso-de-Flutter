import 'package:bytebanktwo/components/editor_number.dart';
import 'package:bytebanktwo/components/editor_text.dart';
import 'package:bytebanktwo/database/dao/contact_dao.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerNconta = TextEditingController();
  final ContactDao _dao = ContactDao();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                EditorText(_controllerNome, 'Nome Completo'),
                EditorNumber(_controllerNconta, 'Numero da Conta'),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => _criarContact(context),
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

  void _criarContact(BuildContext context) {
    final String? name = _controllerNome.text;
    final int? nConta = int.tryParse(_controllerNconta.text);

    var formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      if (name != null && nConta != null) {
        final newContact = Contact(0, name, nConta);
        _dao.save(newContact).then((id) => Navigator.pop(context));
      }
    }
  }
}
