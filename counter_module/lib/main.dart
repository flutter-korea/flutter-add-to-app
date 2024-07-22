import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterResultPage(),
    );
  }
}

class CounterResultPage extends StatelessWidget {
  const CounterResultPage({super.key});

  Future<void> _closeScreen() async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: _closeScreen,
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 200),
            Text(
              'Congratulations!\nYou have pressed the button this many times:',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
