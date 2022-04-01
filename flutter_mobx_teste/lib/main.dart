import 'package:flutter/material.dart';
import 'package:flutter_mobx_teste/screens/form_teste.dart';
import 'package:flutter_mobx_teste/stores/form_store/form_store.dart';
import 'package:get_it/get_it.dart';


void main(){
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<FormStore>(FormStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FormTeste());
  }
}
