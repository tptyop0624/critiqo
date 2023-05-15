import 'package:critiqo3/component/shopping_tips/test1.dart';
import 'package:critiqo3/component/test.dart';
import 'package:critiqo3/main.dart';
import 'package:critiqo3/screens/home_page.dart';
import 'package:critiqo3/theme/text_theme.dart';
import 'package:flutter/material.dart';


class SignUpSelectionPage extends StatefulWidget {
  const SignUpSelectionPage({Key? key}) : super(key: key);

  @override
  State<SignUpSelectionPage> createState() => _SignUpSelectionPageState();
}

class _SignUpSelectionPageState extends State<SignUpSelectionPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('로그인',
        style: CritiqoTheme.lightTextTheme.titleLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('제목',style: CritiqoTheme.lightTextTheme.titleLarge,),
            ElevatedButton(
                onPressed: () {},
                child:  Text('Login in with google')),
            ElevatedButton(
                onPressed: () {}, child: const Text('별도 계정으로 가입하기')),
            ElevatedButton(
                onPressed: () {},
                child: const Text('logout')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
                      },
                child: const Text('Go To Home')
            )
          ],
        ),
      ),
    );
  }
}
