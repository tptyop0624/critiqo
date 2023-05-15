import 'package:flutter/material.dart';

class ReviewRequestInput extends StatefulWidget {
  const ReviewRequestInput({Key? key}) : super(key: key);

  @override
  _ReviewRequestInputState createState() => _ReviewRequestInputState();
}

class _ReviewRequestInputState extends State<ReviewRequestInput> {
  final _formKey = GlobalKey<FormState>();
  final _requestedProduct = TextEditingController();
  final _question1 = TextEditingController();
  final _question2 = TextEditingController();

  @override
  void dispose() {
    _requestedProduct.dispose();
    _question1.dispose();
    _question2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(26),
          ),
        ),
        elevation: 10,
        title: const Text('필요한 리뷰를 요청해주세요'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20
              ),
              Text('리뷰가 필요한 상품'),
              SizedBox(height: 5),
              TextFormField(
                controller: _requestedProduct,
                decoration: const InputDecoration(
                  hintText: '예 : 닌텐도 DS',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수입력 사항입니다. 반드시 입력해주세요. ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Text('상품에 대해 궁금한 점 1'),
              SizedBox(
                height: 10
              ),
              TextFormField(
                controller: _question1,
                decoration: const InputDecoration(
                  hintText: '상품에 대해 궁금한 점 1',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수입력 사항입니다. 반드시 입력해주세요. ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _question2,
                decoration: const InputDecoration(
                  labelText: '상품에 대해 궁금한 점 2',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '필수입력 사항입니다. 반드시 입력해주세요. ';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final requestedProduct = _requestedProduct.text;
                      final question1 = _question1.text;
                      final question2 = _question2.text;
                      print('requestedProduct: $requestedProduct, question1: $question1,question2:$question2' );
                    }
                  },
                  child: const Text('요청하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
