import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:edu_flutter_dart/services/api_service.dart';
import 'package:flutter/material.dart';

// setState는 많이 쓰지 않는 게 좋다 (많이 쓰이지 않는다)
// statelessWidget에서 비동기를 쓰는 방법
//
// FutureBuilder

// This class (or a class that this class inherits from) is marked as '@immutable',
// but one or more of its instance fields aren't final:
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text(
            '오늘의 웹툰',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // context : buildcontext
          // snapshot : know the statue of Future
          if (snapshot.hasData) {
            // 대량의 항목을 나열할 땐 ListView Widget을 사용하는 게 좋다
            // Column, Row X
            // 자동 스크롤뷰 탑재
            return ListView(
              children: [
                // snapshot.data가 null이 아님을 알려주기 위해 뒤에 !를 붙임
                for (var webtoon in snapshot.data!) Text(webtoon.title)
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
