import 'package:critiqo3/component/builder/review_input_field.dart';
import 'package:flutter/material.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('리뷰쓰기',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),),
      ),
      body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              Expanded(
                  child: ReviewInputField()),
            ],
          )),
    );
  }
}
