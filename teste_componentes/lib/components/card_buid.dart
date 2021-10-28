import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:teste_componentes/model/veiculo.dart';
import 'package:teste_componentes/screens/receita_info.dart';

class CardBuid extends StatelessWidget {
  final Veiculo _veiculo;
  final int _index; //index referente a image

  const CardBuid(this._veiculo, this._index,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // tempo da animação
    return Padding(
        padding: const EdgeInsets.only(
            top: 15.0, bottom: 5.0, left: 10.0, right: 10.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return ReceitaInfo(_veiculo,_index);
            }));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity((0.2)),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _veiculo.disponivel
                          ? const Icon(Icons.favorite, color: Colors.orange)
                          : const Icon(Icons.favorite_border,
                          color: Colors.orange)
                    ],
                  ),
                ),
                Hero(
                  tag: _veiculo.imagem+"$_index",
                  child: Container(
                    height: 110.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(_veiculo.imagem), fit: BoxFit.contain)),
                  ),
                ),
                const SizedBox(height: 7.0),
                Text(
                  _veiculo.modelo.nomeModelo.toString(),
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 14.0,
                      fontFamily: 'Varela'),
                ),
                Text(
                  _veiculo.modelo.marca.nomeMarca.toString(),
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 14.0,
                      fontFamily: 'Varela'),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    color: const Color(0xFFEBEBEB), //separador
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: const [
                        Icon(Icons.alarm, color: Colors.red, size: 20),
                        Text(
                          '30 MIN',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Varela',
                              color: Colors.red
                          ),
                        )
                      ]),
                      Column(children: const [
                        Icon(Icons.restaurant_menu,
                            color: Colors.red, size: 20),
                        Text(
                          '3 Porções',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Varela',
                              color: Colors.red
                          ),
                        )
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}