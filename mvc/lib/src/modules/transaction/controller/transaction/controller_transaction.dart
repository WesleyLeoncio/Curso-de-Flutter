import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:mvc/src/modules/others/model/status_page.dart';
import 'package:mvc/src/modules/transaction/model/transaction.dart';
import 'package:mvc/src/modules/transaction/repositories/http/webClients/transaction_webclient.dart';

part 'controller_transaction.g.dart';



class ControllerTransaction = _ControllerTransaction
    with _$ControllerTransaction;

abstract class _ControllerTransaction with Store {
  final TransactionWebClient webClient = TransactionWebClient();

  @observable
  ObservableFuture<List<Transaction>>? listTransaction;

  @observable
  String message = '';

  @computed
  StatusPage get statePage {
    if (listTransaction == null ||
        listTransaction?.status == FutureStatus.rejected) {
      message = listTransaction?.error.message;
      return StatusPage.erro;
    }
    if (listTransaction?.status == FutureStatus.pending) {
      return StatusPage.loading;
    } else {
      return StatusPage.loaded;
    }
  }

  _ControllerTransaction() {
    fillTransaction();
  }

  @action
  Future<void> fillTransaction() async {
     listTransaction = webClient.findAll().asObservable();
  }

  Future<void> inserir(Transaction transaction, String password) async {
    await webClient.save(transaction, '1000');
    await fillTransaction();
  }
}
