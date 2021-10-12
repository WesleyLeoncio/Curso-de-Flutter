import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankAppTwo());
}

class ByteBankAppTwo extends StatelessWidget {
  const ByteBankAppTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('INICIAL'),),
      ),
    );
  }

}
