import 'package:critiqo3/screens/home_page.dart';
import 'package:critiqo3/screens/my_drawer_page.dart';
import 'package:critiqo3/screens/requested_review_page.dart';
import 'package:critiqo3/screens/review_explore_page.dart';
import 'package:critiqo3/screens/shopping_tips_page.dart';
import 'package:critiqo3/screens/splash_page.dart';
import 'package:critiqo3/screens/write_review_page.dart';
import 'package:critiqo3/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Critiqo());
}

class Critiqo extends StatefulWidget {
  const Critiqo({Key? key}) : super(key: key);

  @override
  State<Critiqo> createState() => _CritiqoState();
}

class _CritiqoState extends State<Critiqo> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light(),
      home: const SplashPage(),
      locale: const Locale('ko', 'KR'), // 앱에서 사용하는 locale 설정
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('en', 'US'), // 영어 (미국)
        const Locale('ko', 'KR'), // 한국어
      ],
      // theme:ThemeData() ,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPageIndex = 0;

  void _bottomButtonClick(int index) {
    _selectedPageIndex = index;
    setState(() {});
  }

  List<Widget> pages = [
    const HomePage(),
    const ReviewExplorePage(),
    const MyDrawerPage(),
    const WriteReviewPage(),
    const RequestedReviewPage(),
    const ShoppingTipsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedPageIndex == 1 ||
              _selectedPageIndex == 2 ||
              _selectedPageIndex == 3 ||
              _selectedPageIndex == 4 ||
              _selectedPageIndex == 5 ||
              _selectedPageIndex == 6
          ? null
          : AppBar(
              title: const Text(
                'Critiqo',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _bottomButtonClick,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '리뷰보기'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '내 서랍장'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '리뷰쓰기'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '요청리뷰'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '구매팁'),
        ],
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
