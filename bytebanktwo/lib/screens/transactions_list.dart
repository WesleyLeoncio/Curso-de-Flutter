import 'package:bytebanktwo/model/contact.dart';
import 'package:bytebanktwo/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {

   const TransactionsList({Key? key}) : super(key: key);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
    transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));
    transactions.add(Transaction(100.0, Contact(0, 'Alex', 1000)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transaction transaction = transactions[index];
          return Card(
            child: ListTile(
              tileColor: Colors.green[50],
              leading: const Icon(Icons.monetization_on, color: Colors.green,),
              title: Text(
                transaction.value.toString(),
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.nConta.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

