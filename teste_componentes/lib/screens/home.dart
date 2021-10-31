import 'package:flutter/material.dart';
import 'package:teste_componentes/components/card_buid.dart';
import 'package:teste_componentes/components/centered_message.dart';
import 'package:teste_componentes/components/progress.dart';
import 'package:teste_componentes/http/webClients/veiculo_webcliente.dart';
import 'package:teste_componentes/images/comidas_imagens.dart';
import 'package:teste_componentes/model/veiculo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Imagem para teste
  final VeiculoWebClient _webClient = VeiculoWebClient();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, condition) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, color: Color(0xFFfc4a1a),),
              ),
              floating: true,
              expandedHeight: 205.0,
                flexibleSpace: const FlexibleSpaceBar(
                  background: Image(
                    image: AssetImage('lib/images/CheffOn.png'),
                     fit: BoxFit.cover,
                  ),
                )
            ),
          ];
        },
        body: FutureBuilder<List<Veiculo>>(
          future: _webClient.findAll(),
          builder: (context, AsyncSnapshot<List<Veiculo>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return const Progress();
              case ConnectionState.active:
              // TODO: Handle this case.
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Veiculo>? veiculos = snapshot.data;
                  if (veiculos!.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.74,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: (context, index) {
                        final Veiculo veiculo = veiculos[index];
                        veiculo.imagem = listaimg[index]; // para teste
                        return CardBuid(veiculo, index);
                      },
                      itemCount: veiculos.length,
                    );
                  }
                }
            }
            return const CenteredMessage(
              message: 'Tempo Limite Excedido ;(',
              icon: Icons.error_outline,
              colorIcon: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
