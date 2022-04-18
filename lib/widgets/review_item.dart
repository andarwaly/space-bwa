import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';

class ReviewItem extends StatelessWidget {
  final String userName;
  final String userImg;
  final String review;
  final List<String> items;
  const ReviewItem(
      {Key? key,
      required this.userName,
      required this.userImg,
      required this.items,
      required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(
          userImg,
          height: 56,
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: blackText.copyWith(
                    fontSize: 16, height: 1.8, fontWeight: medium),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                //*NOTE Bintang
                children: const [
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                    size: 24,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                    size: 24,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                    size: 24,
                  ),
                  Icon(
                    Icons.star,
                    color: kYellowColor,
                    size: 24,
                  ),
                  Icon(
                    Icons.star_half,
                    color: kYellowColor,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text.rich(
                TextSpan(
                    text: review,
                    style: grayText.copyWith(height: 1.8),
                    children: [
                      TextSpan(
                          text: 'more',
                          style: blackText.copyWith(
                              fontWeight: medium, height: 1.8))
                    ]),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items
                      .map((item) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: kWhiteGray),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 16),
                            child: Image.asset(
                              item,
                              height: 72,
                              width: 72,
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
