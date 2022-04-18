import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';

class CardPopular extends StatelessWidget {
  final String titles;
  final String imgURL;
  final int price;
  final bool isFavorite;

  const CardPopular({
    Key? key,
    required this.titles,
    required this.imgURL,
    required this.price,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-page');
      },
      child: Container(
        child: Card(
          elevation: 4,
          shadowColor: kLineDark.withOpacity(0.6),
          margin: const EdgeInsets.only(
            left: 24,
            bottom: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 180,
                width: 200,
                decoration: const BoxDecoration(
                    color: kWhiteGray,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: Image.asset(
                  imgURL,
                  width: 160,
                  height: 140,
                ),
              ),
              Container(
                width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles,
                      style: blackText.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$$price',
                          style: blackText.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
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
            ],
          ),
        ),
      ),
    );
  }
}
