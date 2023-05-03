import 'package:critiqo3/component/builder/category_button.dart';
import 'package:critiqo3/component/builder/category_radio_button,dart.dart';
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
        title: const Text('리뷰작성'),
      ),
      body:  Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  child: ReviewInputField()),
            ],
          )),
    );
  }
}
