import 'package:bytebanktwo/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
const String url = "http://192.168.0.108:8080/transactions";




