import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankNewApp());
}

class BytebankNewApp extends StatelessWidget {
  const BytebankNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Dashbord'),
          ),
        ));
  }
}
