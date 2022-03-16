import 'dart:async';
import 'package:bytebanktwo/components/bloc_container.dart';
import 'package:bytebanktwo/components/mensage/error_view.dart';
import 'package:bytebanktwo/components/progress.dart';
import 'package:bytebanktwo/components/transaction_auth_dialog.dart';
import 'package:bytebanktwo/http/webClients/transaction_webclient.dart';
import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:validatorless/validatorless.dart';

@immutable
abstract class TransactionFormState {
  const TransactionFormState();
}

@immutable
class SendingState extends TransactionFormState {
  const SendingState();
}

@immutable
class ShowFormState extends TransactionFormState {
  const ShowFormState();
}

@immutable
class SentState extends TransactionFormState {
  const SentState();
}

@immutable
class FatalErrorFormState extends TransactionFormState {
  final String _message;

  const FatalErrorFormState(this._message);
}

class TransactionFormCubit extends Cubit<TransactionFormState> {
  final TransactionWebClient _webClient = TransactionWebClient();

  TransactionFormCubit() : super(const ShowFormState());

  void _save(Transaction transactionCreated, String password,
      BuildContext context) async {
    emit(const SendingState());
    await _send(transactionCreated, password, context);
  }

  Future<void> _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    try {
      await _webClient.save(transactionCreated, password);
      emit(const SentState());
    } on TimeoutException catch (e) {
      emit(FatalErrorFormState(e.message.toString()));
    } on HttpException catch (e) {
      emit(FatalErrorFormState(e.message));
    } on Exception catch (e) {
      emit(FatalErrorFormState(e.toString()));
    }
  }
}

class TransactionFormContainer extends BlocContainer {
  final Contact _contact;

  const TransactionFormContainer(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionFormCubit>(
        create: (BuildContext context) {
          return TransactionFormCubit();
        },
        child: BlocListener<TransactionFormCubit, TransactionFormState>(
          listener: (context, state) {
            if (state is SentState) {
              Navigator.pop(context);
            }
          },
          child: TransactionFormStaless(_contact),
        ));
  }
}

class TransactionFormStaless extends StatelessWidget {
  final Contact _contact;

  const TransactionFormStaless(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
        builder: (context, state) {
      if (state is ShowFormState) {
        return _BasicForm(_contact);
      }
      if (state is SendingState || state is SentState) {
        return const ProgressView();
      }
      if (state is FatalErrorFormState) {
        return ErrorView(state._message);
      }
      // TODO tela de erro
      return const ErrorView("Unknown error");
    });
  }
}

class _BasicForm extends StatelessWidget {
  final Contact _contact;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valueController = TextEditingController();
  final String transactionId = const Uuid().v4();

  _BasicForm(this._contact);

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
                Text(
                  _contact.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    _contact.accountNumber.toString(),
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
                          final transactionCreated =
                              Transaction(transactionId, value!, _contact);
                          showDialog(
                              context: context,
                              builder: (contextDialog) {
                                return TransactionAuthDialog(
                                  onConfirm: (String password) {
                                    BlocProvider.of<TransactionFormCubit>(
                                            context)
                                        ._save(transactionCreated, password,
                                            context);
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
}
