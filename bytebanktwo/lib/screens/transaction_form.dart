import 'dart:async';

import 'package:bytebanktwo/components/mensage/failure_dialog.dart';
import 'package:bytebanktwo/components/mensage/success_dialog.dart';
import 'package:bytebanktwo/components/progress.dart';
import 'package:bytebanktwo/components/transaction_auth_dialog.dart';
import 'package:bytebanktwo/http/webClients/transaction_webclient.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:validatorless/validatorless.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  const TransactionForm(this.contact, {Key? key}) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String transactionId = const Uuid().v4();
  late bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Transação'),
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Visibility(
                    child: const Progress(
                  titulo: 'Sending...',
                ),visible: _sending),
                Text(
                  widget.contact.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    widget.contact.accountNumber.toString(),
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    validator: Validatorless.multiple([
                      Validatorless.required(
                          'Valor da transferência é obrigatório!'),
                      Validatorless.number("Preencha o campo corretamente"),
                    ]),
                    controller: _valueController,
                    style: const TextStyle(fontSize: 24.0),
                    decoration: const InputDecoration(labelText: 'Value'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(

                      child: const Text('Transfer'),
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          final double? value =
                              double.tryParse(_valueController.text);
                          final transactionCreated = Transaction(
                              transactionId, value!, widget.contact);
                          showDialog(
                              context: context,
                              builder: (contextDialog) {
                                return TransactionAuthDialog(
                                  onConfirm: (String password) {
                                    _save(
                                        transactionCreated, password, context);
                                  },
                                );
                              });
                        }
                      },
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

/*
  void _save(Transaction transactionCreated, String password,
      BuildContext context) async {
    try {
      await _webClient.save(transactionCreated, password);
      await showDialog(
          context: context,
          builder: (contextDialog) {
            return const SuccessDialog("successful transaction");
          });
      Navigator.pop(context);
    } catch (err) {
       showDialog(
          context: context,
          builder: (contextDialog) {
            return FailureDialog(err.toString());
          });
    }
  }*/

  void _save(Transaction transactionCreated, String password,
      BuildContext context) async {
    Transaction transaction =
        await _send(transactionCreated, password, context);
    _showSuccessfulMessage(transaction, context);

  }

  Future<Transaction> _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    setState(() {
      _sending = true;
    });
    final Transaction transaction =
        await _webClient.save(transactionCreated, password).catchError((e) {
      _showFailureMessage(context, msg: 'timeout submitting the transaction');
    }, test: (e) => e is TimeoutException).catchError((e) {
      _showFailureMessage(context, msg: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      _showFailureMessage(context);
    }, test: (e) => e is Exception).whenComplete((){
        setState(() {
          setState(() {
            _sending = false;
          });
        });
        });
    return transaction;
  }

  Future _showSuccessfulMessage(
      Transaction transaction, BuildContext context) async {
    // ignore: unnecessary_null_comparison
    if (transaction != null) {
      await showDialog(
          context: context,
          builder: (contextDialog) {
            return const SuccessDialog('successful transaction');
          });
      Navigator.pop(context);
    }
  }

  Future _showFailureMessage(BuildContext context,
      {String msg = 'Unkown error'}) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(msg);
        });
  }
}
