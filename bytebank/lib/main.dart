import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

////////////////////////////////////////////////////////////////////////////////
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
            Editor(_controllerValorConta, 'Valor', '0.00', Icons.monetization_on),
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

////////////////////////////////////////////////////////////////////////////////
class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
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

  const Editor(this.controller, this.rotulo, this.dica, this.icone, {Key? key})
      : super(key: key);

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
}

////////////////////////////////////////////////////////////////////////////////
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

////////////////////////////////////////////////////////////////////////////////
class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FormularioTransferencia();
            })).then((transferencia) {
              setState(() {
                if(transferencia != null){
                  widget._transferencias.add(transferencia);
                }

              });

            });
          }),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  Transferencia(this.nConta, this.valor);

  @override
  String toString() {
    return 'Transferencia{ nConta: $nConta, valor: $valor}';
  }
} ///////////////////////////////////////////////////////////////////////////////
