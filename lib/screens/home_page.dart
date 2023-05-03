import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  void _keywordSearch() {
    String keyword = _searchController.text;
    _searchController.clear();
    // firestore에서 keyword 검색하는 로직 추가

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 130 ,
            ),
            const Text('구매하기 전 궁금한 여러가지 상품들을 검색해보세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25
            ),),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _searchController,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: '찾고싶은 상품 입력',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.lightBlue, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
              },
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                _keywordSearch();
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                  foregroundColor: Colors.blueGrey,
                  side: const BorderSide(color: Colors.lightBlue, width: 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text('리뷰 검색',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black
              )
                ,),
            )
          ],
        ),
      ),
    );
  }
}
