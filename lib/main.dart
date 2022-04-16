import 'package:flutter/material.dart';
import 'package:space/pages/homepage.dart';
import 'package:space/pages/onboarding_page.dart';
import 'package:space/pages/search_page.dart';
import 'package:space/pages/seearch_result_page.dart';
import 'package:space/pages/splash_page.dart';
import 'package:space/pages/sign_in.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/search-result': (context) => const SearchResultPage(),
      },
    );
  }
}
