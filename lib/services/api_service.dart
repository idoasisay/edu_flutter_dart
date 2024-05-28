import 'dart:convert';

import 'package:edu_flutter_dart/models/webtoon_detail_model.dart';
import 'package:edu_flutter_dart/models/webtoon_episode_model.dart';
import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //궁금점. 그냥 함수를 쓰면 되는데 왜 class를 쓰지?

  // final -> static const로 변환
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  // final -> static const로 변환
  static const String today = "today";

  // final -> static const로 변환
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}


// 공부해야 할 것
// -> static을 하는 이유는 무엇일까?