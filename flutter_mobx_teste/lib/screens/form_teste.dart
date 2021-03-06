import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_teste/components/body_widget_form.dart';
import 'package:flutter_mobx_teste/stores/form_store/form_store.dart';
import 'package:get_it/get_it.dart';

class FormTeste extends StatelessWidget {
  const FormTeste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I.get<FormStore>();
    return Scaffold(
        appBar: AppBar(
          title: Observer(
              builder: (_){
                return Text(store.isValid
                    ? 'Formulario Validado ${store.login}'
                    : 'Formulario não Validado');
              },),
        ),
        body: const BodyWidgetForm());
  }
}
