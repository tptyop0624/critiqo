import 'package:critiqo3/component/review_request/request_input_field.dart';
import 'package:critiqo3/component/review_request/requested_review_list.dart';
import 'package:flutter/material.dart';

class RequestedReviewPage extends StatefulWidget {
  const RequestedReviewPage({Key? key}) : super(key: key);

  @override
  State<RequestedReviewPage> createState() => _RequestedReviewPageState();
}

class _RequestedReviewPageState extends State<RequestedReviewPage> {
  int _selectedPageInRequestPage = 0;

  List<Widget> get pagesInRequestPage => [
        const RequestedReviewList(),
        const ReviewRequestInput(),
      ];

  void _pageMoveinRequestPage(int index) {
    setState(() {
      _selectedPageInRequestPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        leading: _selectedPageInRequestPage == 1
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_selectedPageInRequestPage > 0) {
                    _pageMoveinRequestPage(_selectedPageInRequestPage - 1);
                  }
                },
              )
            : null,
        actions: [
          Row(
            children: [
              const Text('리뷰요청하기'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedPageInRequestPage = 1;
                    });
                  },
                  icon: const Icon(Icons.edit)),
            ],
          )
        ],
        title: const Text('리뷰요청'),
      ),
      body: IndexedStack(
        index: _selectedPageInRequestPage,
        children: pagesInRequestPage,
      ),
    );
  }
}
