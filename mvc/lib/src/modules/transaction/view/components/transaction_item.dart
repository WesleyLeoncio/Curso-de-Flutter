
import 'package:flutter/material.dart';
import 'package:mvc/src/modules/transaction/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  const TransactionItem(this._transaction,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.green[50],
        leading: const Icon(
          Icons.monetization_on,
          color: Colors.green,
        ),
        title: Text(
          _transaction.value.toString(),
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          _transaction.contact.accountNumber.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
