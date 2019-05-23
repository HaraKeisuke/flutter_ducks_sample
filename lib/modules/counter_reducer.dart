import 'package:redux/redux.dart';

enum CounterAction { INCREMENT }

final counterReducer = combineReducers<CounterState>([
  new TypedReducer<CounterState, CounterAction>(actionDispatcher),
]);

CounterState increment(CounterState state, CounterAction action) {
  int _counter = state.counter;
  _counter++;
  return new CounterState(counter: _counter);
}

class CounterState {
  final int counter;
  const CounterState({this.counter = 0});
}

CounterState actionDispatcher(CounterState state, CounterAction action) {
  switch (action) {
    case CounterAction.INCREMENT:
      return increment(state, action);
    default:
      return CounterState();
  }
}
