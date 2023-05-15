import 'package:flutter/material.dart';

class RequestReviewCard extends StatefulWidget {
  const RequestReviewCard({Key? key}) : super(key: key);

  @override
  State<RequestReviewCard> createState() => _RequestReviewCardState();
}

class _RequestReviewCardState extends State<RequestReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '해커스 토익 2020 최신개정판',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 15),
                    Text('Q1 : 외부 작업을 많이 하는데 배터리로 크게 문제가 없을지 궁금합니다.'),
                    Text('Q2 : 궁금한점 2 '),
                    SizedBox(height: 15),
                    Text('2023/05/28'),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Column(
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network('https://picsum.photos/20/25'),
                            const Text('리뷰쓰기')
                          ],
                        ),
                      )),
                  const SizedBox(height: 5),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Icon(Icons.account_circle),
                            const Text('리뷰보기')
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
