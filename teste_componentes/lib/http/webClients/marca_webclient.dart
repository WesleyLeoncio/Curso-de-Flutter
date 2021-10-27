import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_componentes/http/web_cliente.dart';
import 'package:teste_componentes/model/marca.dart';

class MarcaionWebClient {
  Future<List<Marca>> findAll() async {
    final Response response =
        await client.get((Uri.parse(urlMarca))).timeout(const Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Marca.fromJson(json)).toList();
  }
}
