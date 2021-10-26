import 'package:bytebanktwo/components/centered_message.dart';
import 'package:bytebanktwo/components/progress.dart';
import 'package:bytebanktwo/components/transaction_item.dart';
import 'package:bytebanktwo/http/webClients/transaction_webclient.dart';
import 'package:bytebanktwo/model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final TransactionWebClient _webclient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<Transaction>>(
        future: _webclient.findAll(),
        builder: (context, AsyncSnapshot<List<Transaction>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting: // load
              return const Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transaction>? transactions = snapshot.data;
                if (transactions!.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return TransactionItem(transaction);
                    },
                    itemCount: transactions.length,
                  );
                }
                return const CenteredMessage('Lista Vazia',
                    icon: Icons.warning);
              }
          }
          return const CenteredMessage('Erro na api de arquivos :(',
              icon: Icons.error);
        },
      ),
    );
  }
}
