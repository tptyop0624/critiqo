import 'package:critiqo3/screens/sign_up_selection_page.dart';
import 'package:critiqo3/theme/text_theme.dart';
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
            decoration: PageDecoration(
              pageColor: Colors.blueAccent
            ),
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child: Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: const SizedBox(
              width: 1,
            ),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('독립된 리뷰 생태계',
                      style: CritiqoTheme.lightTextTheme.titleLarge!.copyWith(
                        color: Colors.white
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        Text(
                          '프로모션과 각종 이벤트에 휩쓸려 불필요한 \n물건을 구매하지는 않으신가요 ?'
                          '충동적으로 구매했다가 쓰지않아서 중고로 판매하지는 않으신가요 ?'
                          '물건 구매를 위해 광고인지 아닌지 헷갈리는 리뷰들을 \n하루종일 찾아보고 계시진 않으신가요? ',
                          style: CritiqoTheme.lightTextTheme.bodyMedium,
                        ),
                        Text('이제는 구매 플랫폼이 아닌 독립된 리뷰 생태계를 경험하세요',
                            style: CritiqoTheme.lightTextTheme.bodyMedium)
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child: Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: const SizedBox(height: 1),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '효율적이고 낭비없는 소비생활',
                    style: CritiqoTheme.lightTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 200,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('간단한 상품 리뷰를 작성하고 ',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                        Text('내가 구매한 상품들을 한번에 관리하세요',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                        Text('불필요한 구매를 줄일 수 있습니다.',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            titleWidget: Container(
              padding: const EdgeInsets.only(top: 120),
              child: Image.network('https://picsum.photos/500/300'),
            ),
            bodyWidget: const SizedBox(height: 1),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '함께돕는 소비자들',
                    style: CritiqoTheme.lightTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('크리티코는 물건을 구매하는 곳이 아닙니다.',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                        Text('간결하고 진정성 있는 리뷰작성으로 건강한 소비생활을 서로 돕는 곳입니다.',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                        Text('간결하고 진정성 있는 리뷰작성으로 건강한 소비생활을 서로 돕는 곳입니다.',
                            style: CritiqoTheme.lightTextTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        done: const Text('Done'),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SignUpSelectionPage(),
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
