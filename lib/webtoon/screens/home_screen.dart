import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:edu_flutter_dart/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 웹툰모델이라는 데이터 타입(클래스)를 받는 List 생성
  List<WebtoonModel> webtoons = [];
  // 로딩 중이라면?
  bool isLoading = true;

// init state 생성
  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  // 데이터를 받아올 때까지 기다리는 비동기 함수
  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(webtoons);
    // print(isLoading);
    // => setState가 되면 한번 다시 켜진다 build를 다시 호출하기 때문에

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Center(
            child: Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        )),
      ),
    );
  }
}
