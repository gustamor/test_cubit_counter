import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/counter_cubit_implementation.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  screenOrientation();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const AiApp());
}

screenOrientation() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AiApp extends StatelessWidget {
  const AiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(),
      home: BlocProvider(
        create: (context) => CounterCubitImplementation(),
        child: const MyHomePage(
          title: "Titulo",
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _incrementCounter() {
    context.read<CounterCubitImplementation>().increment();
  }

  _decrementCounter() {
    context.read<CounterCubitImplementation>().decrement();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: const Key("main_scaffold"),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.title,
          key: const Key("main_text_title"),
        ),
      ),
      child: Center(
        child: Column(
          key: const Key("main_column"),
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubitImplementation, int>(
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                  key: const Key("count_value"),
                );
              },
            ),
            Row(
              key: const Key("buttons_row"),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                    key: const Key('decremented'),
                    onPressed: _decrementCounter,
                    child: const Icon(CupertinoIcons.minus),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                    key: const Key('incremented'),
                    onPressed: _incrementCounter,
                    child: const Icon(CupertinoIcons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
