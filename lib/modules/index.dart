import './counter_reducer.dart';

class AppState {
  final CounterState counterState;

  const AppState({
    this.counterState = const CounterState(),
  });

  factory AppState.loading() => const AppState();

  AppState copyWith({
    CounterState counterState,
  }) {
    return new AppState(counterState: counterState ?? this.counterState);
  }
}

AppState appReducer(AppState state, action) {
  return new AppState(
    counterState: counterReducer(state.counterState, action),
  );
}
