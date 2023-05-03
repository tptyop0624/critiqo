import 'package:flutter/material.dart';

class ShoppingTipContent extends StatelessWidget {
  const ShoppingTipContent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Title'),
        Center(
          child: Column(
            children:  [Text('Contents'),
              Image.network('https://picsum.photos/200/300')
            ],
          ),
        ),
      ],
    );
  }
}

