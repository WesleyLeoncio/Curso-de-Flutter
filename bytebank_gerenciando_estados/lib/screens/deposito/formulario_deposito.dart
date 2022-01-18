import 'package:bytebank_gerenciando_estados/components/editor.dart';
import 'package:bytebank_gerenciando_estados/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Receber Deposito';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _textBotaoConfirmar = 'Confirmar';
const _icone = Icons.monetization_on;

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controllerCampoValor = TextEditingController();
  FormularioDeposito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: _icone),
            ElevatedButton(
                onPressed: () => _criarDeposito(context),
                child: const Text(_textBotaoConfirmar)),
          ],
        ),
      ),
    );
  }
   _criarDeposito(context){
    final double? valor = double.tryParse(_controllerCampoValor.text);
    final depositoValido = _validarDeposito(valor);
    if(depositoValido){
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validarDeposito(valor){
    final _campoPreenchido = valor != null;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor){
    Provider.of<Saldo>(context, listen:false).adiciona(valor);
  }
}
