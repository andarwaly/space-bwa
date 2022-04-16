import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/card_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteGray,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                LucideIcons.chevronLeft,
                color: kBlackColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: kWhiteGray,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      onFieldSubmitted: ((value) {
                        Navigator.pushNamed(context, '/search-result');
                      }),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          hintText: 'Search Furniture',
                          hintStyle: grayText,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: const Icon(
                            LucideIcons.x,
                            color: kGrayColor,
                          )),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          children: [
            Text(
              'Recomendation',
              style: blackText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 20,
            ),
            const CardProductHorizontal(
                titles: 'Super Gray Chair',
                price: 34,
                imgURL: 'assets/images/kategori1.png'),
            const CardProductHorizontal(
                titles: 'Minimalist Table',
                price: 34,
                imgURL: 'assets/images/kategori2.png'),
            const CardProductHorizontal(
                titles: 'Handsome Blue Chair',
                price: 1000,
                imgURL: 'assets/images/kategori3.png')
          ],
        ));
  }
}
