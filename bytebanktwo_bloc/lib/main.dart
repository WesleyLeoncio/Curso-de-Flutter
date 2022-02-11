import 'package:bytebanktwo/routes/app_routes.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:bytebanktwo/screens/transactions_list.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'components/menu_app.dart';

void main() async{
    runApp(ChangeNotifierProvider(
        create: (context) => ContactListRecharge(), child: const MayApp()));
}

class MayApp extends StatelessWidget {
  const MayApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: tema(),
      home: const MenuApp(),
      routes: {
        AppRoutes.contactList: (context) => const ContactsList(),
        AppRoutes.contactForm: (context) => const ContactForm(),
        AppRoutes.transactionFeed: (context) => const TransactionsList(),
      },
    );
  }
}

////////////
ThemeData tema() {
  return ThemeData(
    colorScheme: const ColorScheme.light()
        .copyWith(primary: Colors.green)
        .copyWith(secondary: Colors.green[700]),
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
