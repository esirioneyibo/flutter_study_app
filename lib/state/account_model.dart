import 'package:scoped_model/scoped_model.dart';

enum FormType {
  LOGIN,
  REGISTER,
}

class AccountModel extends Model {
  FormType _formType = FormType.LOGIN;

  get formType => _formType;

  changeType(FormType type) {
    _formType = type;
    notifyListeners();
  }
}
