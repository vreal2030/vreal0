import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      color: Colors.white,
      theme: ThemeData(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
            )),
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.white,
            primarySwatch: Colors.grey,
            brightness: Brightness.light),
      ),
      title: 'vreal',
      home: Home(),
    );
  }
}
