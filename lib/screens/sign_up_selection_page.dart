import 'package:critiqo3/main.dart';
import 'package:critiqo3/screens/home_page.dart';
import 'package:flutter/material.dart';


class SignUpSelectionPage extends StatefulWidget {
  const SignUpSelectionPage({Key? key}) : super(key: key);

  @override
  State<SignUpSelectionPage> createState() => _SignUpSelectionPageState();
}

class _SignUpSelectionPageState extends State<SignUpSelectionPage> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<void> _handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('로그인 성공')));
  //     if (googleUser == null) {
  //       // User canceled the sign-in process
  //       return;
  //     }
  //     // Perform additional tasks with the signed-in user's data (e.g., save to Firestore, navigate to another page)
  //   } catch (error) {
  //     // Handle error during sign-in process
  //     print(error);
  //   }
  // }

  // void googleSignOut() async {
  //   await _googleSignIn.signOut();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('로그아웃 성공')));
  // }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text('Login in with google')),
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
