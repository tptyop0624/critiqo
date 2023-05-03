import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const OnBoardingPage(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('낭비없는 소비생활을 위해'),
            SizedBox(height: 10),
            Text(
              'CRITIQO',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
