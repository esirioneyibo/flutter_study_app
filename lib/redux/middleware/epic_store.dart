import 'dart:async';

import 'package:redux/redux.dart';

class EpicStore<State> {
  final Store<State> _store;

  EpicStore(this._store);

  /// Returns the current state of the redux store
  State get state => _store.state;

  Stream<State> get onChange => _store.onChange;
}






typedef Stream<dynamic> Epic<State>(
    Stream<dynamic> actions, EpicStore<State> store);

abstract class EpicClass<State> {
  Stream<dynamic> call(
    Stream<dynamic> actions,
    EpicStore<State> store,
  );
}

class TypedEpic<State, Action> extends EpicClass<State> {
  final Stream<dynamic> Function(
    Stream<Action> actions,
    EpicStore<State> store,
  ) epic;

  TypedEpic(this.epic);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<State> store) {
    return epic(
      actions.transform(StreamTransformer<dynamic, Action>.fromHandlers(
        handleData: (dynamic action, EventSink<Action> sink) {
          if (action is Action) {
            sink.add(action);
          }
        },
      )),
      store,
    );
  }
}
