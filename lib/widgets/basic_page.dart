import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
