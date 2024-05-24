import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:edu_flutter_dart/services/api_service.dart';
import 'package:edu_flutter_dart/widgets/webtoon_widget.dart';
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
            /// 사용자가 볼 때만 호출이 된다. (메모리 효율성)
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                // Expanded가 뭐였지?
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      /// List item 사이에 렌더
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    );
  }
}
