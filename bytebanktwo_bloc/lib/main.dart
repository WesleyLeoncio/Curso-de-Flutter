import 'package:bytebanktwo/routes/app_routes.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:bytebanktwo/screens/dashboard.dart';
import 'package:bytebanktwo/screens/transactions_list.dart';
import 'package:flutter/material.dart';


void main() async{
   runApp(const MayApp());
}


class MayApp extends StatelessWidget {
  const MayApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: tema(),
      home: const DashboardContainer(),
      routes: {
        AppRoutes.contactListContainer: (context) => const ContactsListContainer(),
        AppRoutes.contactForm: (context) =>  const ContactForm(),
        AppRoutes.transactionFeed: (context) => const TransactionsList(),
      },
    );
  }
}

////////////
ThemeData tema() {
  return ThemeData(
    colorScheme: const ColorScheme.light()
        .copyWith(primary: Colors.green[700])
        .copyWith(secondary: Colors.green[700]),
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
