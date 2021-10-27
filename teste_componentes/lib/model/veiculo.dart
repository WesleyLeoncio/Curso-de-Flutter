import 'package:teste_componentes/model/modelo.dart';

class Veiculo {
  int id;
  String chassi;
  String combustivel;
  double valorVenda;
  String ano;
  int portas;
  String cor;
  String imagem;
  bool disponivel;
  Modelo modelo;

  Veiculo(this.id, this.chassi, this.combustivel, this.valorVenda, this.ano,
      this.portas, this.cor, this.imagem, this.disponivel, this.modelo);


  Veiculo.fromJson(Map<String, dynamic> json) :
        id = 0,
        chassi = json['chassi'],
        combustivel = json['combustivel'],
        valorVenda = json['valorVenda'],
        ano = json['ano'],
        portas = json['portas'],
        cor = json['cor'],
        imagem = json['imagem'],
        disponivel = json['disponivel'],
        modelo = Modelo.fromJson(json['modelo']);


  Map<String, dynamic> toJson() => {
    'id': id,
    'chassi' : chassi,
    'combustivel' : combustivel,
    'valorVenda' : valorVenda,
    'ano' : ano,
    'portas' : portas,
    'cor' : cor,
    'imagem' : imagem,
    'disponivel' : disponivel,
    'modelo' : modelo.toJson(),
  };

}
