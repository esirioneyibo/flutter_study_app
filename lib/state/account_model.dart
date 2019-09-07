import 'package:scoped_model/scoped_model.dart';

enum FormType {
  LOGIN,
  REGISTER,
}

class AccountModel extends Model {
  FormType _formType = FormType.LOGIN;

  get formType => _formType;

  set formType(type) {
    _formType = type;
  }

  changeType(FormType type) {
    formType = type;
    notifyListeners();
  }
}
