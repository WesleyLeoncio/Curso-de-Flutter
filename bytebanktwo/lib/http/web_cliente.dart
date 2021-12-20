import 'package:bytebanktwo/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5)
);
const String url = "http://192.168.0.108:8080/transactions";
//const String url = "http://192.168.0.108:8080/teste";