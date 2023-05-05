import 'package:flutter/material.dart';

class CenterConstrainedBox extends StatelessWidget {
  const CenterConstrainedBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450),
        child: child,
      ),
    );
  }
}
