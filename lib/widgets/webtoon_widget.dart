import 'package:edu_flutter_dart/webtoon/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    /// 대부분의 동작을 감지하도록 해주는 GestureDetector
    return GestureDetector(
      onTap: () {
        // 애니메이션 효과를 넣어서 스크린을 이동시킴
        Navigator.push(
          context,
          // 스크린을 라우트로 묶어준다
          // 그저 stl일 뿐인 스크린을 렌더함
          // 다른 페이지로 이동했다고 느껴질 수 있게 함. 그런데 페이지는 아닌!
          // 팝업 개념인데 전체로 띄워 줘서 페이지처럼 보인다.
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
