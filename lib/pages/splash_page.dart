import 'dart:async';

import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboard', ((route) => false));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor,
        body: SafeArea(
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                width: 98,
                height: 82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_white.png'),
                  ),
                ),
              ),
              Text(
                'Space',
                style: whiteText.copyWith(
                  fontSize: 36,
                  fontWeight: bold,
                ),
              ),
            ],
          )),
        ));
  }
}
