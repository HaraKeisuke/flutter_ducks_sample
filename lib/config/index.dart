import 'package:redux/redux.dart';
import '../modules/index.dart';

Store<AppState> createStore() {
  return new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: [],
  );
}
