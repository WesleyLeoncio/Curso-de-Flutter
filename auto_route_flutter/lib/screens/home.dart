import 'package:auto_route/auto_route.dart';


import 'package:flutter/material.dart';

import '../routes/router.gr.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => router.pushNamed('/Pg1'),
                    child: const Text("PG1")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => router.push(Pg2(name: 'Wesley Leoncio')),
                    child: const Text("PG2")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => router.pushNamed('/Pg3'),
                    child: const Text("PG3")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
