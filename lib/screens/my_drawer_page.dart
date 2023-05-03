import 'package:critiqo3/component/mydrawer/my_Items.dart';
import 'package:critiqo3/component/mydrawer/my_info.dart';
import 'package:flutter/material.dart';

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  _MyDrawerPageState createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  int _selectedPageInMydrawer = 0;
  List<Widget> pagesInMyDrawer = [
    const MyItemsPage(),
    const MyInfoPage(),
  ];

  void _pageMoveindrawer(int index) {
    setState(() {
      _selectedPageInMydrawer = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedPageInMydrawer == 1
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_selectedPageInMydrawer > 0) {
              _pageMoveindrawer(_selectedPageInMydrawer - 1);
            }
          },
        )
            : null,
        backgroundColor: Colors.lightBlue,
        title: const Text('내 서랍장',
          style: TextStyle(
              fontSize: 25
          ),),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _pageMoveindrawer(1);
                },
                child: const Text(
                  '내 정보 수정',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '로그아웃',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedPageInMydrawer,
        children: pagesInMyDrawer,
      ),
    );
  }
}
