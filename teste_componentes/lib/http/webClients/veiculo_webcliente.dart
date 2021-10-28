import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart';
import 'package:teste_componentes/http/web_cliente.dart';
import 'package:teste_componentes/model/veiculo.dart';

class VeiculoWebClient {
  Future<List<Veiculo>> findAll() async {
    final Response response =
    await client.get((Uri.parse(urlVeiculo))).timeout(const Duration(seconds: 35));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Veiculo.fromJson(json)).toList();
  }
}
