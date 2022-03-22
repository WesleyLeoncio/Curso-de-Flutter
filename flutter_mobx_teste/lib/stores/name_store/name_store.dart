import 'package:mobx/mobx.dart';
part 'name_store.g.dart';

class NameStore = _NameStore with _$NameStore;

abstract class _NameStore with Store{
 @observable
  String name = '';

 @observable
  String sobrenome = '';

 @action
  alterarName (newName) => name = newName;

 @action
  alterarSobrenome (newSobrenome) => sobrenome = newSobrenome;

  // Altera mais de um valor
  @computed
  String get nameCompleto => '$name $sobrenome';

}