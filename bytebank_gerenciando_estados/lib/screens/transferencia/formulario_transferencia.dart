import 'package:bytebank_gerenciando_estados/components/editor.dart';
import 'package:bytebank_gerenciando_estados/models/saldo.dart';
import 'package:bytebank_gerenciando_estados/models/transferencia.dart';
import 'package:bytebank_gerenciando_estados/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValorConta = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerNumeroConta,
                rotulo: 'Numero Conta',
                dica: '0000',
                icone: null),
            Editor(
                controller: _controllerValorConta,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
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
    final transferenciaValida = _validaTransferencia(context,nConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(nConta!, valor!);

      _atualizaEstado(context, novaTransferencia, valor);

      Navigator.pop(context);
    } else {
      debugPrint('Preencha os campos corretamente');
    }

  }

  _validaTransferencia(context,numeroConta, valor){
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <= Provider.of<Saldo>(context, listen:false).valor;
    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia,valor){
      Provider.of<Transferencias>(context, listen:false).adiciona(novaTransferencia);
      Provider.of<Saldo>(context, listen:false).subtrai(valor);
  }
}
