import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

// Redux
import './config/index.dart';
import './modules/index.dart';
import './modules/counter_reducer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = createStore();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => store,
        builder: (context, Store<AppState> store) => Scaffold(
              appBar: AppBar(
                title: Text(this.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      store.state.counterState.counter.toString(),
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => {store.dispatch(CounterAction.INCREMENT)},
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ));
  }
}
