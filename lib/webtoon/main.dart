import 'package:edu_flutter_dart/webtoon/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // 이 위젯의 key를 stateless widget이라는 super class에 보낸 것
  // 위젯은 key를 가지고 있고 ID처럼 쓰인다.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon App',
      home: HomeScreen(),
    );
  }
}
