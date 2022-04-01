import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mvc/src/modules/others/components/message/failure_dialog.dart';
import 'package:mvc/src/modules/transaction/controller/transaction_controller/controller_transaction.dart';
import 'package:mvc/src/modules/transaction/model/contact.dart';
import 'package:mvc/src/modules/transaction/model/transaction.dart';
import 'package:mvc/src/modules/transaction/view/components/transaction_item.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ControllerTransaction>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
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
      body: Observer(builder: (BuildContext context) {
        if (controller.listTransaction?.error != null) {
          return const FailureDialog("Erro de Internet");
        }
        if (controller.listTransaction?.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Transaction>? list = controller.listTransaction?.value;

        return ListView.builder(
          itemCount: list!.length,
          itemBuilder: (_, index) {
            var transaction = list[index];
            return TransactionItem(transaction);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () {
          Contact contact = Contact(1, 'WESLEY', 896);
          Transaction transaction = Transaction('16 ', 427399, contact);
          controller.inserir(transaction, '1000');
        },
      ),
    );
  }
}
