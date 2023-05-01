import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'vreal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  debugPrint('hello1');
                },
                child: const Text(
                  '블랙마카_수정됨',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  debugPrint('hello2');
                },
                child: const Text(
                  '아르기닌',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            ElevatedButton(
                onPressed: () {
                  debugPrint('hello3');
                },
                child: const Text(
                  '쏘팔메토',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
