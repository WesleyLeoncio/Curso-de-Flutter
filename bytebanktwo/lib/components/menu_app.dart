import 'package:bytebanktwo/screens/contacts_list.dart';
import 'package:bytebanktwo/screens/dashboard.dart';
import 'package:bytebanktwo/screens/transactions_list.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  int selectdedPage = 0;
  final _pageOption = const [
    Dashboard(),
    ContactsList(),
    TransactionsList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[selectdedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Colors.green,
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF283c86), Color(0xFF45a247)]
        ),
        items: listTabItem() ,
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int index) {
          setState(() {
            selectdedPage = index;
          });
        },
      ),
    );
  }
}

List<TabItem> listTabItem(){
  return const [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.monetization_on, title: 'Transfer'),
    TabItem(icon: Icons.description, title: 'Transaction Feed'),
  ];
}
