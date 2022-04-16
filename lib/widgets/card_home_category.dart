import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class HomeCategoryItem extends StatelessWidget {
  final String titles;
  final String subtitles;
  final String imgUrl;

  const HomeCategoryItem({
    Key? key,
    required this.titles,
    required this.subtitles,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      alignment: Alignment.bottomCenter,
      width: MediaQuery.of(context).size.width - (48),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 102,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(children: [
                SizedBox(
                  width: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titles,
                      style: blackText.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      subtitles,
                      style: grayText.copyWith(
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
          Image.asset(
            imgUrl,
            width: 140,
            height: 124,
          )
        ],
      ),
    );
  }
}
