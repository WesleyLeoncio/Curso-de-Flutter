import 'package:bytebanktwo/routess/app_routes.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactListRecharge(),
      child: const ByteBankAppTwo()));
}

class ByteBankAppTwo extends StatelessWidget {
  const ByteBankAppTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: tema(),
      routes: {
        AppRoutes.home: (context) => const Dashboard(),
        AppRoutes.contactList: (context) => const ContactsList(),
        AppRoutes.contactForm: (context) => const ContactForm()
      },
    );
  }
}
////////////
ThemeData tema(){
  return ThemeData(
    colorScheme: const ColorScheme.light()
        .copyWith(primary: Colors.green[900])
        .copyWith(secondary: Colors.green[700]),
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}