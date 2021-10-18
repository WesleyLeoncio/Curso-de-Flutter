import 'package:bytebanktwo/routess/app_routes.dart';
import 'package:bytebanktwo/screens/contacts_form.dart';
import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:bytebanktwo/views/contact_list_recharge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactListRecharge(), child: const ByteBankAppTwo()));
}

class ByteBankAppTwo extends StatelessWidget {
  const ByteBankAppTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.light()
              .copyWith(primary: Colors.green[900])
              .copyWith(secondary: Colors.green[700])),
      routes: {
        AppRoutes.home: (context) => const Dashboard(),
        AppRoutes.contactList: (context) => const ContactsList(),
        AppRoutes.contactForm: (context) => const ContactForm()
      },
    );
  }
}
