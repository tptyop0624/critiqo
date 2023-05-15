import 'package:critiqo3/component/review_request/requested_review_card.dart';
import 'package:flutter/material.dart';

class RequestedReviewList extends StatefulWidget {
  const RequestedReviewList({Key? key}) : super(key: key);

  @override
  State<RequestedReviewList> createState() => _RequestedReviewListState();
}

class _RequestedReviewListState extends State<RequestedReviewList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) {
                return const RequestReviewCard();
              }

          ),
        ],
      ),
    );
  }
}
