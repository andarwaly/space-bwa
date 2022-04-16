import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/widgets/card_home_category.dart';
import 'package:space/widgets/card_product.dart';

import '../theme.dart';

class CateGoryPage extends StatelessWidget {
  const CateGoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          height: 24,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            InkWell(
              splashColor: kWhiteColor,
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(
                LucideIcons.chevronLeft,
                color: kBlackColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'Chair',
              style: blackText.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            const Spacer(),
            const Icon(
              LucideIcons.search,
              color: kBlackColor,
              size: 24,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              LucideIcons.sliders,
              color: kBlackColor,
              size: 24,
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CardHomeCategory(
                titles: 'Super Gray Chair',
                subtitles: 'Chair',
                imgUrl: 'assets/images/kategori1.png'),
            const SizedBox(height: 24),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: const [
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori1.png',
                    price: 34,
                    isFavorite: true),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori3.png',
                    price: 34,
                    isFavorite: false),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori4.png',
                    price: 34,
                    isFavorite: false),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori2.png',
                    price: 34,
                    isFavorite: true),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori4.png',
                    price: 34,
                    isFavorite: false),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori2.png',
                    price: 34,
                    isFavorite: true),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori1.png',
                    price: 34,
                    isFavorite: false),
                CardProductVertical(
                    titles: 'Poan Chair',
                    imgURL: 'assets/images/kategori3.png',
                    price: 34,
                    isFavorite: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}
