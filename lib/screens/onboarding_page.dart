import 'package:critiqo3/screens/sign_up_selection_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child:
              Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: SizedBox(width: 1,),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '독립된 리뷰 생태계',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    '프로모션과 각종 이벤트에 휩쓸려 불필요한 물건을\n구매하지는 않으신가요 ?'
                        '충동적으로 구매했다가 쓰지않아서 중고로 판매하지는 않으신가요 ?'
                        '물건 구매를 위해 광고인지 아닌지 헷갈리는 리뷰들을 \n하루종일 찾아보고 계시진 않으신가요? ',
                  ),
                  SizedBox(height: 25),
                  Text(
                    '이제는 구매 플랫폼이 아닌 독립된 리뷰 생태계를 경험하세요',
                  )
                ],
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child:
              Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: const SizedBox(height: 1),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '효율적이고 낭비없는 소비생활',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    '간단한 상품 리뷰를 작성하고 ',
                  ),
                  Text(
                    '내가 구매한 상품들을 한번에 관리하세요',
                  ),
                  Text(
                    '불필요한 구매를 줄일 수 있습니다.',
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child:
              Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: const SizedBox(height: 1),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '함께돕는 소비자들',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    '크리티코는 물건을 구매하는 곳이 아닙니다.',
                  ),
                  Text(
                    '간결하고 진정성 있는 리뷰작성으로 건강한 소비생활을 서로 돕는 곳입니다.',
                  ),
                  Text(
                    '텍스트',
                  )
                ],
              ),
            ),
          ),
        ],
        done: const Text('Done'),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  const SignUpSelectionPage(),
            ),
          );
        },
        next: const Icon(Icons.arrow_forward),
        dotsDecorator: DotsDecorator(
            color: Colors.blue,
            size: const Size(10, 10),
            activeSize: const Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            activeColor: Colors.blueAccent),
        curve: Curves.linear,
      ),
    );
  }
}


