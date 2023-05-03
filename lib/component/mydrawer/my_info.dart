import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
