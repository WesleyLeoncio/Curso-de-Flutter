
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/pg4.dart';
import '../screens/pg5.dart';




/* Exemplos
class SettingsRoutePg3 extends StatelessWidget {
  const SettingsRoutePg3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}*/

class SettingsRoutePg3 extends StatelessWidget {
  final String titulo;
  const SettingsRoutePg3({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo),),
      body: const AutoRouter(),
    );
  }
}
const routesPg3 = AutoRoute(
  name: 'SettingsRouterPg3',
  path: '/settingsPg3',
  page: SettingsRoutePg3,
  children: [
    AutoRoute(path: 'pg4', page: Pg4),
    AutoRoute(path: 'pg5', page: Pg5),
  ],
);
