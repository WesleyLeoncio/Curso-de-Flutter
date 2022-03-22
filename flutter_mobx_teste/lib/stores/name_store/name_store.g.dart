// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NameStore on _NameStore, Store {
  Computed<String>? _$nameCompletoComputed;

  @override
  String get nameCompleto =>
      (_$nameCompletoComputed ??= Computed<String>(() => super.nameCompleto,
              name: '_NameStore.nameCompleto'))
          .value;

  final _$nameAtom = Atom(name: '_NameStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$sobrenomeAtom = Atom(name: '_NameStore.sobrenome');

  @override
  String get sobrenome {
    _$sobrenomeAtom.reportRead();
    return super.sobrenome;
  }

  @override
  set sobrenome(String value) {
    _$sobrenomeAtom.reportWrite(value, super.sobrenome, () {
      super.sobrenome = value;
    });
  }

  final _$_NameStoreActionController = ActionController(name: '_NameStore');

  @override
  dynamic alterarName(dynamic newName) {
    final _$actionInfo = _$_NameStoreActionController.startAction(
        name: '_NameStore.alterarName');
    try {
      return super.alterarName(newName);
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarSobrenome(dynamic newSobrenome) {
    final _$actionInfo = _$_NameStoreActionController.startAction(
        name: '_NameStore.alterarSobrenome');
    try {
      return super.alterarSobrenome(newSobrenome);
    } finally {
      _$_NameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
sobrenome: ${sobrenome},
nameCompleto: ${nameCompleto}
    ''';
  }
}
