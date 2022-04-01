import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'modules/transaction/controller/transaction_controller/controller_transaction.dart';
import 'modules/transaction/view/transaction_page/transaction.dart';




void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ControllerTransaction>(ControllerTransaction());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TransactionPage(),
    );
  }
}
