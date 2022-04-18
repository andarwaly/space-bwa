// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/widgets/review_item.dart';
import '../theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color indicatorColor = const Color(0xff394A54);
  double initialMargin = 5;
  int currentIndex = 1;
  bool isExpand = false;
  bool isShowReview = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kWhiteGray,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/pattern_bg.png',
          ),
          Container(
            //* NOTE Product Image
            padding: const EdgeInsets.symmetric(horizontal: 24),
            margin: const EdgeInsets.only(top: 96),
            child: Image.asset(
              'assets/images/prod_detail$currentIndex.png',
            ),
          ),
          Container(
            //*NOTE Back Button
            margin: const EdgeInsets.only(left: 20, top: 44),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kWhiteColor,
              border: Border.all(color: kLineDark),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                LucideIcons.chevronLeft,
                size: 24,
                color: kBlackColor,
              ),
            ),
          ),
          SizedBox.expand(
            //* NOTE Card Detail Product
            child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 0.95,
                builder:
                    (BuildContext build, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: NotificationListener(
                      onNotification: (Notification notif) {
                        if (notif is ScrollEndNotification) {
                          if (notif.metrics.minScrollExtent == -1) {
                            setState(() {
                              isExpand = true;
                            });
                          } else {
                            setState(() {
                              isExpand = false;
                              isShowReview = false;
                            });
                          }
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Container(
                                height: 3,
                                width: 30,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kLineDark,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                      currentIndex == 1
                                          ? 'Poang Navy Chair'
                                          : currentIndex == 2
                                              ? 'Poang Yellow Chair'
                                              : currentIndex == 3
                                                  ? 'Poang Gray Chair'
                                                  : currentIndex == 4
                                                      ? 'Poang Black Chair'
                                                      : 'Poang Cream Chair',
                                      style: blackText.copyWith(
                                          fontSize: 24, fontWeight: semiBold)),
                                  const Spacer(),
                                  Text(
                                    '\$219',
                                    style: blackText.copyWith(fontSize: 24),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'IKOE',
                                  style: blackText.copyWith(fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                //* NOTE Color Indicator
                                margin: const EdgeInsets.only(bottom: 16),
                                height: 56,
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Row(children: [
                                        colorIndicator(
                                            const Color(0xff394A54), 0),
                                        colorIndicator(
                                            const Color(0xffEBA823), 1),
                                        colorIndicator(
                                            const Color(0xff757477), 2),
                                        colorIndicator(
                                            const Color(0xff29282C), 3),
                                        colorIndicator(
                                            const Color(0xffECE9DA), 4)
                                      ]),
                                      AnimatedContainer(
                                        //* NOTE Indicator Selector
                                        duration:
                                            const Duration(milliseconds: 450),
                                        curve: Curves.easeOutQuint,
                                        width: 40,
                                        height: 40,
                                        margin: EdgeInsets.only(
                                            left: initialMargin),
                                        decoration: BoxDecoration(
                                            color: indicatorColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: kWhiteColor,
                                              width: 3.0,
                                            )),
                                      )
                                    ]),
                              ),
                              Text(
                                'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                                style: grayText.copyWith(
                                    fontWeight: semiBold, height: 1.8),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                                style: grayText.copyWith(
                                    fontWeight: semiBold, height: 1.8),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                                style: grayText.copyWith(
                                    fontWeight: semiBold, height: 1.8),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                                style: grayText.copyWith(
                                    fontWeight: semiBold, height: 1.8),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                                style: grayText.copyWith(
                                    fontWeight: semiBold, height: 1.8),
                              ),
                              const SizedBox(
                                height: 44,
                              ),
                              isShowReview
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Review',
                                          style: blackText.copyWith(
                                              fontSize: 24,
                                              fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ReviewItem(
                                            userName: 'Lydia Clayton',
                                            userImg:
                                                'assets/images/reviewer1.png',
                                            items: [
                                              'assets/images/prod_grid1.png',
                                              'assets/images/prod_grid2.png',
                                              'assets/images/prod_grid3.png'
                                            ],
                                            review:
                                                'Open repair of infrarenal aortic aneurysm or dissection, plus of a repair of associated arterial...'),
                                        ReviewItem(
                                            userName: 'Audra Still',
                                            userImg:
                                                'assets/images/reviewer2.png',
                                            items: [
                                              'assets/images/prod_grid4.png',
                                              'assets/images/prod_grid2.png',
                                            ],
                                            review:
                                                'Open repair of infrarenal aortic aneurysm or dissection, plus of a repair of associated arterial...'),
                                        ReviewItem(
                                            userName: 'Joan Gray',
                                            userImg:
                                                'assets/images/reviewer3.png',
                                            items: [
                                              'assets/images/prod_grid1.png',
                                              'assets/images/prod_grid4.png',
                                              'assets/images/prod_grid3.png'
                                            ],
                                            review:
                                                'Open repair of infrarenal aortic aneurysm or dissection, plus of a repair of associated arterial...'),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: isShowReview
          ? null
          : isExpand
              ? seeMoreOverlay()
              : ctaBottom(),
    );
  }

  Widget ctaBottom() {
    return Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 4),
            ),
          ]),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhiteGray,
          ),
          child: const Icon(
            LucideIcons.shoppingCart,
            size: 24,
            color: kBlackColor,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kBlackColor,
            ),
            height: 56,
            child: Center(
              child: Text(
                'Buy Now',
                style: whiteText.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget seeMoreOverlay() {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kWhiteColor.withOpacity(0.5), kWhiteColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: (() {
              setState(() {
                isShowReview = true;
              });
            }),
            child: Text(
              'See More',
              style: blueText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          )
        ],
      ),
    );
  }

  Widget colorIndicator(Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indicatorColor = color;
          initialMargin = 5 + (index * 62);
          currentIndex = index + 1;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
