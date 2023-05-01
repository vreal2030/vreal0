import 'package:flutter/material.dart';
import 'package:vreal_0/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: 'Pretendard',
        fontFamily: 'Gmarket Sans',
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey, brightness: Brightness.dark),
      ),
      title: 'vreal',
      home: App(),
    );
  }
}
