import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vreal Admin'),
        centerTitle: false,
      ),
      body: Column(
        children: [Text('Menu1')],
      ),
    );
  }
}
