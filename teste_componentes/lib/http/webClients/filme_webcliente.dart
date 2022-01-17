import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_componentes/http/web_cliente.dart';

String url = "https://api.themoviedb.org/3/movie/popular?api_key=16e4ee6f65d0a3dbfa2697bd50f10cdd&language=pt-br&page=1";
class FilmeWebCliente{
   Future findAll() async{
     final Response response =
     await client.get((Uri.parse(url))).timeout(const Duration(seconds: 35));
     print('Teste: '+response.body);
  }
}