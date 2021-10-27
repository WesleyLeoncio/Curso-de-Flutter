import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'interceptors/logging_interceptor.dart';

Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String urlMarca = "http://csr-backend-spring.herokuapp.com/marcas";
const String urlModelo = "https://csr-backend-spring.herokuapp.com/modelos";
const String urlVeiculo = "https://csr-backend-spring.herokuapp.com/veiculos";



