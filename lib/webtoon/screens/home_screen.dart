import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:edu_flutter_dart/services/api_service.dart';
import 'package:flutter/material.dart';

/// setState는 많이 쓰지 않는 게 좋다 (많이 쓰이지 않는다)
/// statelessWidget에서 비동기를 쓰는 방법
///
/// FutureBuilder

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
            return const Text("There is data!");
          }
          return const Text("Loading");
        },
      ),
    );
  }
}
