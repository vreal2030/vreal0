import 'package:flutter/material.dart';
import 'package:vreal_0/src/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        debugPrint('Splash Start');
        await Future.delayed(const Duration(milliseconds: 1500));
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        debugPrint('Splash End');
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/icon/icon.png',
          width: MediaQuery.of(context).size.width > 450
              ? 450 * 0.7
              : MediaQuery.of(context).size.width * 0.7,
        ),
      ),
    );
  }
}
