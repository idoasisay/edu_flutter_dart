import 'dart:convert';

import 'package:edu_flutter_dart/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //궁금점. 그냥 함수를 쓰면 되는데 왜 class를 쓰지?
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      print(webtoonInstances.first.title);
      return webtoonInstances;
    }
    throw Error();
  }
}
