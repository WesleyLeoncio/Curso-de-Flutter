import 'package:flutter/material.dart';
import 'package:teste_componentes/components/card_buid.dart';
import 'package:teste_componentes/components/centered_message.dart';
import 'package:teste_componentes/components/progress.dart';
import 'package:teste_componentes/http/webClients/filme_webcliente.dart';
import 'package:teste_componentes/http/webClients/veiculo_webcliente.dart';
import 'package:teste_componentes/images/comidas_imagens.dart';
import 'package:teste_componentes/model/veiculo.dart';

class MarcaTela extends StatefulWidget {
  const MarcaTela({Key? key}) : super(key: key);

  @override
  State<MarcaTela> createState() => _MarcaTelaState();
}

class _MarcaTelaState extends State<MarcaTela> {
  // final MarcaionWebClient _webclient = MarcaionWebClient();
  final FilmeWebCliente webCliente = FilmeWebCliente();

  @override
  Widget build(BuildContext context) {
    webCliente.findAll();
    return const Scaffold(
      body: Center(child: Text('TESTE'))
    );
  }
}
