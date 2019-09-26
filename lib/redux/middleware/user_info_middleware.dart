import 'package:flutter_study_app/redux/middleware/epic_store.dart';
import 'package:flutter_study_app/redux/reducer/user_reducer.dart';
import 'package:flutter_study_app/redux/ys_app_state.dart';
import 'package:flutter_study_app/service/http_service.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

class FetchUserAction {}

class UserInfoMiddleware implements MiddlewareClass<YsAppState> {
  @override
  void call(Store<YsAppState> store, dynamic action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      print("*********** UserInfoMiddleware *********** ");
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}

class UserInfoEpic implements EpicClass<YsAppState> {
  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<YsAppState> store) {
    return Observable(actions)
        .whereType<FetchUserAction>()
        .debounce(((_) => TimerStream(true, const Duration(milliseconds: 10))))
        .switchMap((action) => _loadUserInfo());
  }

  // Use the async* function to make easier
  Stream<dynamic> _loadUserInfo() async* {
    print("*********** userInfoEpic _loadUserInfo ***********");
    var res = await HttpService.getUserInfo();
    yield UpdateUserAction(res.data);
  }
}
