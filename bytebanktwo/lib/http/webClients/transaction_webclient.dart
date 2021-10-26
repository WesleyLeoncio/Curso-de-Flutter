import 'dart:async';
import 'dart:convert';

import 'package:bytebanktwo/http/web_cliente.dart';
import 'package:bytebanktwo/model/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get((Uri.parse(url)))
        .timeout(const Duration(seconds: 5));
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map((dynamic json) => Transaction.fromJson(json))
          .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
