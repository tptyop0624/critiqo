import 'package:critiqo3/component/shopping_tips/shopping_tip_content.dart';
import 'package:flutter/material.dart';
import 'package:critiqo3/component/shopping_tips/Shopping_tips_card_list.dart';

class ShoppingTipsPage extends StatefulWidget {
  const ShoppingTipsPage({Key? key}) : super(key: key);


  @override
  State<ShoppingTipsPage> createState() => _ShoppingTipsPageState();
}

class _ShoppingTipsPageState extends State<ShoppingTipsPage> {
  final tipCardList = tipCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '쇼핑정보',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body:ListView.builder(
        itemCount: tipCardList.length,
        itemBuilder: (context, index) => TipCard(
          title: tipCardList[index]['title'],
          views: tipCardList[index]['views'],
          thumbnail: tipCardList[index]['thumbnail'] as Widget,
          summary: tipCardList[index]['summary'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShoppingTipContent(
                  imageIndex: index + 1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String title;
  final int views;
  final Widget thumbnail;
  final String summary;
  final VoidCallback? onTap;

  const TipCard({
    Key? key,
    required this.title,
    required this.views,
    required this.thumbnail,
    required this.summary,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 12.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.black26),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              thumbnail,
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    '$views views',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(summary),
            ],
          ),
        ),
      ),
    );
  }
}