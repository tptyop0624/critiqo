import 'package:flutter/material.dart';

class RequestedReviewPage extends StatefulWidget {
  const RequestedReviewPage({Key? key}) : super(key: key);

  @override
  State<RequestedReviewPage> createState() => _RequestedReviewPageState();
}

class _RequestedReviewPageState extends State<RequestedReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('리뷰요청'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
                }

            )],
        ),
      ),
    );
  }
}
