import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String login = '';

  @observable
  String password = '';

  @action
  changeLogin(String value) => login = value;

  @action
  changePassword(String value) => password = value;

  @computed
  bool get isValid {
    return validationLogin() == null && validationPassword() == null;
  }

  validationLogin() {
    if (login == '') {
      return 'O campo é obrigatorio';
    } else if (login.length < 3) {
      return 'O campo deve ter mais de 3 caracter';
    }
  }

  validationPassword() {
    if (password == '') {
      return 'O campo é obrigatorio';
    }
  }
}
