import 'package:flutter/material.dart';

class Pg2 extends StatelessWidget {
  final String name;
  const Pg2({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PG2"),
      ),body: Center(child: Text(name)),
    );
  }
}
