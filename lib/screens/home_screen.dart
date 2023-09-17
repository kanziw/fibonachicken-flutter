import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          '피보나치킨 계산기',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await launchUrlString(
                  'https://github.com/kanziw/fibonachicken-flutter');
            },
            icon: const Icon(MaterialCommunityIcons.github),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.deny(RegExp(r'^0')),
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '몇 명이 잡수시나요?',
                  suffix: Text('명 이면..'),
                ),
              ),
              const SizedBox(height: 20),
              const Text('16닭!'),
              const SizedBox(height: 20),
              const Text('🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔🐔'),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                child: const Text('세상 만사...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
