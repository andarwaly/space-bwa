// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class CardRecomendation extends StatelessWidget {
  final String titles;
  final String imgURL;
  final int price;

  const CardRecomendation(
      {Key? key,
      required this.titles,
      required this.price,
      required this.imgURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(4),
          height: 64,
          width: 64,
          child: Image.asset(imgURL),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kLineDark,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titles,
                style: blackText.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text('\$$price',
                  style: blackText.copyWith(
                    fontSize: 16,
                  ))
            ])
      ]),
    );
  }
}
