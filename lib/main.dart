import 'package:flutter/material.dart';
import 'package:vreal_0/src/home.dart';

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
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey, brightness: Brightness.light),
      ),
      title: 'vreal',
      home: Home(),
    );
  }
}
