import 'package:fibonachicken/fibonachicken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int peopleCount = 0;
  int chickenCount = 0;

  onTextFieldChanged(String value) {
    setState(() {
      peopleCount = int.tryParse(value) ?? 0;
      chickenCount = fibonaChicken(peopleCount);
    });
  }

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
      body: SingleChildScrollView(
        child: Center(
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
                    LengthLimitingTextInputFormatter(12),
                  ],
                  onChanged: onTextFieldChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '몇 명이 잡수시나요?',
                    suffix: Text('명 이면..'),
                  ),
                ),
                const SizedBox(height: 20),
                Text('$chickenCount닭!🐔'),
                const SizedBox(height: 20),
                Text(
                  peopleCount < 10000
                      ? '🐔' * chickenCount
                      : '이정도면 🐔이 모자라지 않을까요...?',
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text('세상 만사...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
