import 'package:flutter/material.dart';
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
    );
  }
}
