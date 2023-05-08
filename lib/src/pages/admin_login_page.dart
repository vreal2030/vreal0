import 'package:flutter/material.dart';
import 'package:vreal_0/src/pages/admin_home_page.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('로그인'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminHome(),
              ));
        },
      )),
    );
  }
}
