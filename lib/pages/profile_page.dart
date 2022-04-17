import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/widgets/profile_option.dart';
import '../theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLightMode = true;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 450),
      opacity: opacity,
      child: Scaffold(
        backgroundColor: isLightMode ? kWhiteGray : kBlackBg,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: 2,
            onTap: (value) {
              if (value == 0) {
                setState(() {
                  Navigator.pushNamed(context, '/home');
                });
              } else {
                if (value == 1) {
                  setState(() {
                    Navigator.pushNamed(context, '/wishlist-page');
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
            backgroundColor: isLightMode ? kWhiteColor : kBlackAccentBG,
          ),
        ),
        body: Stack(
          children: [
            Image.asset(isLightMode
                ? 'assets/images/pattern_bg.png'
                : 'assets/images/pattern_bg_dark.png'),
            ListView(
              children: [
                //* NOTE Section Header
                Container(
                  margin: const EdgeInsets.only(top: 72),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/userpp.png',
                            height: 112,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Theresa Webb',
                            style: isLightMode
                                ? blackText.copyWith(
                                    fontSize: 24, fontWeight: semiBold)
                                : whiteText.copyWith(
                                    fontSize: 24, fontWeight: semiBold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              isLightMode = !isLightMode;
                              opacity = 0.6;
                            },
                          );
                          Timer(const Duration(milliseconds: 250), () {
                            setState(() {
                              opacity = 1;
                            });
                          });
                        },
                        child: Container(
                          height: 44,
                          width: 80,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: isLightMode ? kWhiteColor : kBlackAccentBG,
                          ),
                          child: AnimatedAlign(
                            alignment: isLightMode
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                constraints: const BoxConstraints(
                                    maxHeight: 36, maxWidth: 36),
                                decoration: BoxDecoration(
                                    color:
                                        isLightMode ? kWhiteGray : kBlackGrayBG,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  isLightMode
                                      ? LucideIcons.moon
                                      : LucideIcons.sun,
                                  size: 16,
                                  color:
                                      isLightMode ? kBlackAccent : kYellowColor,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //* NOTE Menu Section
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: isLightMode ? kWhiteColor : kBlackAccentBG,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      ProfileOption(
                        menu: 'My Profile',
                        preffixIcon: LucideIcons.user,
                        suffixIcon: LucideIcons.chevronRight,
                        isLightMode: isLightMode,
                      ),
                      ProfileOption(
                        menu: 'My Address',
                        preffixIcon: LucideIcons.map,
                        suffixIcon: LucideIcons.chevronRight,
                        isLightMode: isLightMode,
                      ),
                      ProfileOption(
                        menu: 'My Order',
                        preffixIcon: LucideIcons.shoppingBag,
                        suffixIcon: LucideIcons.chevronRight,
                        isLightMode: isLightMode,
                      ),
                      ProfileOption(
                          menu: 'Payment Method',
                          preffixIcon: LucideIcons.banknote,
                          suffixIcon: LucideIcons.chevronRight,
                          isLightMode: isLightMode),
                      ProfileOption(
                          menu: 'My Wishlist',
                          preffixIcon: LucideIcons.heart,
                          suffixIcon: LucideIcons.chevronRight,
                          isLightMode: isLightMode),
                      ProfileOption(
                          menu: 'Frequently Asked Questions',
                          preffixIcon: LucideIcons.helpCircle,
                          suffixIcon: LucideIcons.chevronRight,
                          isLightMode: isLightMode),
                      ProfileOption(
                          menu: 'Customer Care',
                          preffixIcon: LucideIcons.headphones,
                          suffixIcon: LucideIcons.chevronRight,
                          isLightMode: isLightMode),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
