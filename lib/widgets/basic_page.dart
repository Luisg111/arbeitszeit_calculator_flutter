import "package:flutter/material.dart";

class BasicPage extends StatelessWidget {
  const BasicPage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
