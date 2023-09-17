import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          '피보나치킨',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
