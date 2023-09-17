import 'package:expandable/expandable.dart';
import 'package:fibonachicken/fibonachicken.dart';
import 'package:flutter/gestures.dart';
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
            fontSize: 36,
          ),
        ),
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () async {
              await launchUrlString(
                  'https://github.com/kanziw/fibonachicken-flutter');
            },
            icon: const Icon(
              MaterialCommunityIcons.github,
              size: 30,
            ),
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
                    label: Text(
                      '몇 명이 잡수시나요?',
                      style: TextStyle(fontSize: 20),
                    ),
                    suffix: Text('명 이면..'),
                  ),
                ),
                if (peopleCount > 0)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          '$chickenCount닭!🐔',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        peopleCount < 10000
                            ? '🐔' * chickenCount
                            : '이정도면 🐔이 모자라지 않을까요...?',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ExpandablePanel(
                  header: const Text('세상 만사..'),
                  collapsed: const Text(''),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          '모든 것의 균형은 황금 비율에서 그 해답을 찾을 수 있고, 이를 수학적으로 풀어낸것이 바로 피보나치 수열이니라.'),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '일찍이 선지자가 있어, 치킨과 피보나치 수열의 관계를 밝힌 자들이 있으니 그들의 끝을 모르는 탐구 정신과 널리 인간과 치킨을 이롭게 하려는 마음을 높이 사, 내 잠시 짬을 내어 허접한 코드질을 하였으니 이를 ',
                            ),
                            TextSpan(
                              text: '피보나치킨',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' 계산기라고 부르도록 하겠다.',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                            children: [
                              const TextSpan(text: '원작자('),
                              TextSpan(
                                text: '@scari_net',
                                recognizer: TapGestureRecognizer()
                                  ..onTapDown = (details) async {
                                    await launchUrlString(
                                        'https://twitter.com/scari_net');
                                  },
                              ),
                              const TextSpan(
                                  text: ')의 동의를 얻어 게시하였습니다 :) from '),
                              TextSpan(
                                text: 'https://fibonachicken.herokuapp.com',
                                recognizer: TapGestureRecognizer()
                                  ..onTapDown = (details) async {
                                    await launchUrlString(
                                        'https://fibonachicken.herokuapp.com/');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  theme: const ExpandableThemeData(
                    useInkWell: false,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    animationDuration: Duration(milliseconds: 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
