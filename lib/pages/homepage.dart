import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/card_popular.dart';
import 'package:space/widgets/card_home_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGray,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          selectedItemColor: kBlackColor,
          unselectedItemColor: kGrayColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.home,
                  size: 24,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.heart,
                  size: 24,
                ),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.user,
                  size: 24,
                ),
                label: 'Profile'),
          ],
          backgroundColor: kWhiteColor,
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/pattern_bg.png'),
          ListView(
            children: [
              //* NOTE Section Header
              Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_black.png',
                      height: 44,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Space',
                      style: blackText.copyWith(fontSize: 20, fontWeight: bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        LucideIcons.shoppingCart,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              //* NOTE Search Bar
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    right: 24,
                    left: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: kWhiteColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Search Furniture',
                        style: grayText.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        LucideIcons.search,
                        size: 24,
                        color: kGrayColor,
                      )
                    ],
                  ),
                ),
              ),
              //* NOTE Title Category
              Container(
                margin: const EdgeInsets.only(
                  top: 24,
                  right: 24,
                  left: 24,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: blackText.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Show All',
                      style: blackText,
                    )
                  ],
                ),
              ),
              //* NOTE Carousel Slider Category
              Container(
                margin: const EdgeInsets.only(
                  top: 24,
                ),
                child: CarouselSlider(
                  items: const [
                    HomeCategoryItem(
                        titles: 'Super Gray Chair',
                        subtitles: 'Chair',
                        imgUrl: 'assets/images/kategori1.png'),
                    HomeCategoryItem(
                        titles: 'Minimalis Table',
                        subtitles: 'Table',
                        imgUrl: 'assets/images/kategori2.png'),
                    HomeCategoryItem(
                        titles: 'Handsome Blue Chair',
                        subtitles: 'Chair',
                        imgUrl: 'assets/images/kategori3.png')
                  ],
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 124,
                    enableInfiniteScroll: false,
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 550,
                    ),
                    autoPlayCurve: Curves.easeInOutCubic,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: controller,
                ),
              ),
              //* NOTE Category Indicator
              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                  right: 24,
                  left: 24,
                ),
                child: Row(children: [
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == 0 ? kBlackColor : kLineDark,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == 1 ? kBlackColor : kLineDark,
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == 2 ? kBlackColor : kLineDark,
                    ),
                  )
                ]),
              ),
              //* NOTE Popular Section
              Container(
                margin: const EdgeInsets.only(top: 24),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        right: 24,
                        left: 24,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: blackText.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Show All',
                            style: blackText,
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 24),
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: const [
                          CardPopular(
                              titles: 'Poan Chair',
                              imgURL: 'assets/images/kategori3.png',
                              price: 34,
                              isFavorite: true),
                          CardPopular(
                              titles: 'Poan Chair',
                              imgURL: 'assets/images/kategori4.png',
                              price: 34,
                              isFavorite: false),
                          CardPopular(
                              titles: 'Poan Chair',
                              imgURL: 'assets/images/kategori1.png',
                              price: 34,
                              isFavorite: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
