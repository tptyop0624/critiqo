import 'package:critiqo3/component/shopping_tips/shopping_tip_content.dart';
import 'package:flutter/material.dart';

class ShoppingTipsPage extends StatefulWidget {
  const ShoppingTipsPage({Key? key}) : super(key: key);

  @override
  State<ShoppingTipsPage> createState() => _ShoppingTipsPageState();
}

class _ShoppingTipsPageState extends State<ShoppingTipsPage> {
  // int _selectedPageInShoppingTips = 0;
  // List<Widget> pagesInShoppingtips = [
  //   const ShoppintTipsPage(),
  //   const ShoppingTipContent(),
  // ];
  //
  // void _pageMoveinShoppingtips(int index) {
  //   setState(() {
  //     _selectedPageInShoppingTips = index;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쇼핑정보',style: TextStyle(fontSize: 25),),
      ),
      body: ListView(
        children: [
          TipCard(
            title: 'Check site security before you ',
            views: 100,
            thumbnail: Image.asset(
              'assets/images/pic/1755.jpg', // storage에 저장되는 썸네일 사진
              fit: BoxFit.cover,
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at ',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary summary summary summary summaryddddd summary summary summary summary summaryssssss',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
          TipCard(
            title: 'Check tipping options at checkout',
            views: 50,
            thumbnail: Image.asset(
              'assets/images/pic/a1.png',
              width: 350,
              height: 200,
            ),
            summary: 'summary',
          ),
        ],
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String title;
  final int views;
  final Image thumbnail;
  final String summary;

  const TipCard({
    Key? key,
    required this.title,
    required this.views,
    required this.thumbnail,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
              color: Colors.black26
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            thumbnail,
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  title,style: TextStyle(fontSize: 20),
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
            Text(summary)
          ],
        ),
      ),
    );
  }
}

