import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValorConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(_controllerNumeroConta, 'Numero Conta', '0000', null),
            Editor(
                _controllerValorConta, 'Valor', '0.00', Icons.monetization_on),
            ElevatedButton(
                onPressed: () => _criarTransferencia(context),
                child: const Text('Confirmar')),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? nConta = int.tryParse(_controllerNumeroConta.text);
    final double? valor = double.tryParse(_controllerValorConta.text);
    if (nConta != null && valor != null) {
      final transferencia = Transferencia(nConta, valor);
      Navigator.pop(context, transferencia);
    } else {
      debugPrint('Preencha os campos corretamente');
    }
  }
}
