import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

////////////////////////////////////////////////////////////////////////////////
class FormularioTrasferencia extends StatelessWidget {
  FormularioTrasferencia({Key? key}) : super(key: key);
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValorConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controllerNumeroConta, 'Numero Conta', '0000', null),
          Editor(_controllerValorConta, 'Valor', '0000', Icons.monetization_on),
          ElevatedButton(
              onPressed: () => _criarTransferencia(
                  _controllerNumeroConta, _controllerValorConta),
              child: const Text('Confirmar')),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTrasferencia(),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  const Editor(this.controller, this.rotulo, this.dica, this.icone, {Key? key})
      : super(key: key);
}

////////////////////////////////////////////////////////////////////////////////
class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(1000, 1000)),
          ItemTransferencia(Transferencia(2000, 2000)),
          ItemTransferencia(Transferencia(3000, 3000)),
          ItemTransferencia(Transferencia(4000, 4000)),
          ItemTransferencia(Transferencia(5000, 5000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.nConta.toString()),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class Transferencia {
  final double valor;
  final int nConta;

  Transferencia(this.valor, this.nConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, nConta: $nConta}';
  }
} ///////////////////////////////////////////////////////////////////////////////

void _criarTransferencia(controllerNumeroConta, controllerValorConta) {
  final int? nConta = int.tryParse(controllerNumeroConta.text);
  final double? valor = double.tryParse(controllerValorConta.text);
  if (nConta != null && valor != null) {
    final transferencia = Transferencia(valor, nConta);
    debugPrint('$transferencia');
  } else {
    debugPrint('Preencha os campos corretamente');
  }
}
