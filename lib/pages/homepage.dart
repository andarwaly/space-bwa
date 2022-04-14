import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    );
  }
}
