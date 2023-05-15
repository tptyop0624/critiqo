import 'package:critiqo3/component/mydrawer/my_review_map.dart';
import 'package:flutter/material.dart';

class MyItemCard extends StatelessWidget {
  const MyItemCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  final MyReview review;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(review.productName),
                  const SizedBox(height: 10),
                  Text(review.brand),
                  const SizedBox(height: 10),
                  Text('${review.score.toString()}점'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(review.purchasedDate),
                  const SizedBox(height: 10),
                  Text('${review.price.toString()}원'),
                  const SizedBox(height: 10),
                  Text('${review.afterPurchase.toString()}일 째 사용중'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('내가 쓴 리뷰')),
                  ElevatedButton(onPressed: () {}, child: const Text('다른리뷰 보기')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
