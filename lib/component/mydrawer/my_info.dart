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
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(26),
          ),
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 10,
        title: const Text('내 정보 보기'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('이름'),
                subtitle: Text('홍길동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('전화번호'),
                subtitle: Text('010-1234-5678'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('이메일'),
                subtitle: Text('hong@gmail.com'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('주소'),
                subtitle: Text('서울특별시 강남구 역삼동'),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
