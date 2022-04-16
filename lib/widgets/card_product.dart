// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space/theme.dart';

class SkeletonProduct extends StatelessWidget {
  const SkeletonProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 72) / 2,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    color: kLineDark, borderRadius: BorderRadius.circular(7)),
                width: double.infinity,
                height: 120,
              ),
              baseColor: kLineDark,
              highlightColor: kWhiteGray,
            ),
            const SizedBox(
              height: 16,
            ),
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    color: kLineDark, borderRadius: BorderRadius.circular(7)),
                width: double.infinity,
                height: 24,
              ),
              baseColor: kLineDark,
              highlightColor: kWhiteGray,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    decoration: BoxDecoration(
                        color: kLineDark,
                        borderRadius: BorderRadius.circular(7)),
                    width: 72,
                    height: 24,
                  ),
                  baseColor: kLineDark,
                  highlightColor: kWhiteGray,
                ),
                Shimmer.fromColors(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kLineDark, shape: BoxShape.circle),
                    width: 32,
                    height: 32,
                  ),
                  baseColor: kLineDark,
                  highlightColor: kWhiteGray,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardProductVertical extends StatelessWidget {
  final String titles;
  final String imgURL;
  final int price;
  final bool isFavorite;

  const CardProductVertical({
    Key? key,
    required this.titles,
    required this.imgURL,
    required this.price,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 72) / 2,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: kLineDark, borderRadius: BorderRadius.circular(7)),
              width: double.infinity,
              height: 120,
              child: Image.asset(imgURL),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 24,
              child: Text(
                titles,
                style: blackAccentText.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 72,
                  height: 24,
                  child: Text(
                    '\$$price',
                    style:
                        blackText.copyWith(fontSize: 18, fontWeight: semiBold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFavorite ? kRedColor : kLineDark,
                  ),
                  child: Icon(
                    LucideIcons.heart,
                    size: 24,
                    color: isFavorite ? kWhiteColor : kGrayColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardProductHorizontal extends StatelessWidget {
  final String titles;
  final String imgURL;
  final int price;

  const CardProductHorizontal(
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
                style: blackAccentText.copyWith(
                    fontSize: 18, fontWeight: semiBold),
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
