import 'package:critiqo3/component/builder/category_button.dart';
import 'package:flutter/material.dart';

class ReviewExplorePage extends StatefulWidget {
  const ReviewExplorePage({Key? key}) : super(key: key);

  @override
  State<ReviewExplorePage> createState() => _ReviewExplorePageState();
}

class _ReviewExplorePageState extends State<ReviewExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('리뷰보기',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),),
      ),
      drawer: ReviewFilter(),
      );
  }
}
