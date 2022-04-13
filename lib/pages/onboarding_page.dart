import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:space/widgets/onboard_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: const [
                OnboardCarousel(
                    imgUrl: 'assets/images/img_ob1.png',
                    title: 'Best Price',
                    subtitle:
                        'No need to Worry about your Money, We offer best furniture with best price!'),
                OnboardCarousel(
                    imgUrl: 'assets/images/img_ob2.png',
                    title: 'Fast Delivery',
                    subtitle: 'Arrive at your door like Lightning McQueen'),
                OnboardCarousel(
                    imgUrl: 'assets/images/img_ob3.png',
                    title: 'Buy Furniture Easily',
                    subtitle:
                        'Search, Choose, Pay. Easy as Pie. Why wait? Beutify your home now'),
              ],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                initialPage: currentIndex,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollPhysics: const BouncingScrollPhysics(),
              ),
              carouselController: controller,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.animateToPage(2);
                      },
                      child: Text(
                        'SKIP',
                        style: blackText.copyWith(
                          fontSize: 18,
                        ),
                      )),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 0 ? kBlackColor : kLineDark,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 1 ? kBlackColor : kLineDark,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == 2 ? kBlackColor : kLineDark,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        if (currentIndex == 2) {
                          Navigator.pushNamed(context, '/sign-in');
                        } else {
                          controller.nextPage();
                        }
                      },
                      child: Text(
                        currentIndex == 2 ? 'SIGN IN' : 'NEXT',
                        style: blackText.copyWith(
                          fontSize: 18,
                        ),
                      )),
                ],
              ))
        ],
      ),
    ));
  }
}
