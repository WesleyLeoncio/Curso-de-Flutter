import 'package:teste_componentes/model/marca.dart';


class Modelo {
  int id;
  String nomeModelo;
  Marca marca;

  Modelo(this.id, this.nomeModelo, this.marca);

  Modelo.fromJson(Map<String, dynamic> json) :
    id = 0,
    nomeModelo = json['nomeModelo'],
    marca = Marca.fromJson(json['marca']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'nomeModelo': nomeModelo,
    'marca': marca.toJson(),
  };

}