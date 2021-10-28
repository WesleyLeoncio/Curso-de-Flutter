import 'package:flutter/material.dart';
import 'package:teste_componentes/components/centered_message.dart';
import 'package:teste_componentes/components/progress.dart';
import 'package:teste_componentes/http/webClients/veiculo_webcliente.dart';
import 'package:teste_componentes/model/veiculo.dart';
import 'package:teste_componentes/screens/carro_info.dart';

class CarroTela extends StatefulWidget {
  const CarroTela({Key? key}) : super(key: key);

  @override
  State<CarroTela> createState() => _CarroTelaState();
}

class _CarroTelaState extends State<CarroTela> {
  final VeiculoWebClient _webClient = VeiculoWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Carros'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF8a2387),
                    Color(0xFFf27121),
                    Color(0xFFe94057)
                  ]),
            ),
          ),
        ),
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
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Veiculo veiculo = veiculos[index];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return CarroInfo(veiculo);
                              }));
                            },
                            title: Text(veiculo.modelo.nomeModelo.toString()),
                            subtitle:
                                Text(veiculo.modelo.marca.nomeMarca.toString()),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.green,
                                  ),
                                  Text(veiculo.valorVenda.toString()),
                                ],
                              ),
                            ),
                          ),
                        );
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
        ));
  }
}
