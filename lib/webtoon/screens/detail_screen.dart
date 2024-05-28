import 'package:edu_flutter_dart/models/webtoon_detail_model.dart';
import 'package:edu_flutter_dart/models/webtoon_episode_model.dart';
import 'package:edu_flutter_dart/services/api_service.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// 받아온 data를 재init 할 때 이런 식으로 사용할 수 있다.
class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episode;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episode = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Hero(
              tag: widget.id,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    // clipBehavior 때문에 보더가 먹히지 않는다.
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                      // 그림자 위쪽이 잘려 있음
                      // List에 Padding이 없어서 그렇다
                      BoxShadow(
                          blurRadius: 7,
                          offset: Offset(0, 0),
                          color: Color.fromARGB(123, 0, 0, 0))
                    ]),
                width: 250,
                child: Image.network(
                  widget.thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
