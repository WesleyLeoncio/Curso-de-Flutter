import 'package:flutter/material.dart';

class Pg5 extends StatelessWidget {
  final String name;
  const Pg5({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(name));
  }
}
