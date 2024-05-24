class WebtoonModel {
  final String title, thumb, id;

  // 이렇게 하는 대신 named constructor를 만들어 볼 거라고 한다.
  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  // name constructor
  // 보통 이 방식으로 사용함
  // 콘스트럭터의 인수만 적어 주고, 프로퍼티를 적어 주면 초기화할 수 있음.

  // map은 key-value 데이터 구조
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
