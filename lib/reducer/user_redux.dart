import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<FirebaseUser>([
  TypedReducer<FirebaseUser, UpdateUserAction>(
      _updateLoaded)
]);

//定一个 UpdateUserAction ，用于发起 userInfo 的的改变
///类名随你喜欢定义，只要通过上面TypedReducer绑定就好
class UpdateUserAction {
  final FirebaseUser user;

  UpdateUserAction(this.user);
}

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的user，并返回
FirebaseUser _updateLoaded(
    FirebaseUser user, UpdateUserAction action) {
  user = action.user;
  return user;
}
