import 'package:auto_route/auto_route.dart';
import 'package:auto_route_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';

class Pg3 extends StatelessWidget {
  const Pg3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => {
                    router.push(
                      SettingsRouterPg3(
                        titulo: "Pagina 4",
                        children: const[
                          Pg4(),
                        ],
                      ),
                    ),
                      },
                  child: const Text("PG4")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ElevatedButton(onPressed: () => {
                    router.push(
                      SettingsRouterPg3(
                        titulo: "Pagina 5",
                        children: [
                            Pg5(name: "Wesley"),
                        ],
                      ),
                    ),
                  }, child: const Text("PG5")),
            ),
          ],
        ),
      ),
    );
  }
}
