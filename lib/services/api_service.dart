import 'package:http/http.dart' as http;

class ApiService {
  //궁금점. 그냥 함수를 쓰면 되는데 왜 class를 쓰지?
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return;
    }
    throw Error();
  }
}
