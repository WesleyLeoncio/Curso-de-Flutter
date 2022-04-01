// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_transaction.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerTransaction on _ControllerTransaction, Store {
  Computed<StatusPage>? _$statePageComputed;

  @override
  StatusPage get statePage =>
      (_$statePageComputed ??= Computed<StatusPage>(() => super.statePage,
              name: '_ControllerTransaction.statePage'))
          .value;

  final _$listTransactionAtom =
      Atom(name: '_ControllerTransaction.listTransaction');

  @override
  ObservableFuture<List<Transaction>>? get listTransaction {
    _$listTransactionAtom.reportRead();
    return super.listTransaction;
  }

  @override
  set listTransaction(ObservableFuture<List<Transaction>>? value) {
    _$listTransactionAtom.reportWrite(value, super.listTransaction, () {
      super.listTransaction = value;
    });
  }

  final _$messageAtom = Atom(name: '_ControllerTransaction.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$fillTransactionAsyncAction =
      AsyncAction('_ControllerTransaction.fillTransaction');

  @override
  Future<void> fillTransaction() {
    return _$fillTransactionAsyncAction.run(() => super.fillTransaction());
  }

  @override
  String toString() {
    return '''
listTransaction: ${listTransaction},
message: ${message},
statePage: ${statePage}
    ''';
  }
}
