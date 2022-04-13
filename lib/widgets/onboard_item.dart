import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class OnboardCarousel extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const OnboardCarousel(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(
              top: 86,
            ),
            child: Image.asset(imgUrl)),
        const SizedBox(
          height: 64,
        ),
        Text(
          title,
          style: blackText.copyWith(
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: grayText.copyWith(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
