import 'package:critiqo3/component/mydrawer/my_review_map.dart';
import 'package:flutter/material.dart';
import 'my_item_card.dart';

class MyItemCardList extends StatelessWidget {
  final List<MyReview> reviews;

  const MyItemCardList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ButtonBar(
            children: [],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (BuildContext context, int index) {
              return MyItemCard(review: reviews[index]);
            },
          ),
        ],
      ),
    );
  }
}

