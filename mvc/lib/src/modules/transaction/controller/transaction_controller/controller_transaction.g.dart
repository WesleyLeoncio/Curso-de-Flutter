// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_transaction.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerTransaction on _ControllerTransaction, Store {
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

  final _$_ControllerTransactionActionController =
      ActionController(name: '_ControllerTransaction');

  @override
  dynamic fillTransaction() {
    final _$actionInfo = _$_ControllerTransactionActionController.startAction(
        name: '_ControllerTransaction.fillTransaction');
    try {
      return super.fillTransaction();
    } finally {
      _$_ControllerTransactionActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTransaction: ${listTransaction}
    ''';
  }
}
