import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/widgets/card_product.dart';

import '../theme.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
            height: 24,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              // InkWell(
              //   splashColor: kWhiteColor,
              //   onTap: (() {
              //     Navigator.pop(context);
              //   }),
              //   child: const Icon(
              //     LucideIcons.chevronLeft,
              //     color: kBlackColor,
              //     size: 24,
              //   ),
              // ),
              // const SizedBox(
              //   width: 12,
              // ),
              Text(
                'Wishlist',
                style: blackText.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: const Icon(
                  LucideIcons.search,
                  color: kBlackColor,
                  size: 24,
                ),
              ),
            ]),
          ),
        ),
      ),
      backgroundColor: kWhiteGray,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: 1,
          onTap: (value) {
            if (value == 0) {
              setState(() {
                Navigator.pushNamed(context, '/home');
              });
            } else {
              if (value == 2) {
                setState(() {
                  Navigator.pushNamed(context, '/profile-page');
                });
              }
            }
          },
          selectedItemColor: kBlueColor,
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [isLoading ? skeletonLoading() : gridView()],
      ),
    );
  }

  Widget skeletonLoading() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: const [
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct()
      ],
    );
  }

  Widget gridView() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: const [
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori1.png',
            price: 34,
            isFavorite: true),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori3.png',
            price: 34,
            isFavorite: false),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori4.png',
            price: 34,
            isFavorite: false),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori2.png',
            price: 34,
            isFavorite: true),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori4.png',
            price: 34,
            isFavorite: false),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori2.png',
            price: 34,
            isFavorite: true),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori1.png',
            price: 34,
            isFavorite: false),
        CardProductVertical(
            titles: 'Poan Chair',
            imgURL: 'assets/images/kategori3.png',
            price: 34,
            isFavorite: false),
      ],
    );
  }
}
