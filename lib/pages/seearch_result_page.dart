import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:space/widgets/card_product.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool isLoading = true;
  bool isShowGrid = true;
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: kWhiteGray,
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(children: [
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
              ),
              const SizedBox(
                width: 12,
              ),
              const Icon(
                LucideIcons.sliders,
                size: 20,
                color: kBlackColor,
              )
            ]),
            bottom:
                TabBar(indicatorColor: kBlackAccent, isScrollable: true, tabs: [
              Tab(
                child: Text('Chair',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semiBold)),
              ),
              Tab(
                child: Text('Table',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semiBold)),
              ),
              Tab(
                child: Text('Accesories',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semiBold)),
              ),
              Tab(
                child: Text('Living Room',
                    style:
                        blackText.copyWith(fontSize: 16, fontWeight: semiBold)),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              tabItem(),
              tabItem(),
              tabItem(),
              tabItem(),
            ],
          )),
    );
  }

  Widget tabItem() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Result for : Poang',
              style: blackText.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Icon(
                isShowGrid ? LucideIcons.layoutList : LucideIcons.layoutGrid,
                size: 20,
                color: kBlackColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        isLoading
            ? skeletonLoading()
            : isShowGrid
                ? gridView()
                : listView()
      ],
    );
  }

  Widget skeletonLoading() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: const [
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct(),
        SkeletonProduct()
      ],
    );
  }

  Widget gridView() {
    return Wrap(
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
    );
  }

  Widget listView() {
    return Column(
      children: const [
        CardProductHorizontal(
            titles: 'Super Gray Chair',
            price: 34,
            imgURL: 'assets/images/kategori1.png'),
        CardProductHorizontal(
            titles: 'Minimalist Table',
            price: 34,
            imgURL: 'assets/images/kategori2.png'),
        CardProductHorizontal(
            titles: 'Handsome Blue Chair',
            price: 1000,
            imgURL: 'assets/images/kategori3.png'),
        CardProductHorizontal(
            titles: 'Super Gray Chair',
            price: 34,
            imgURL: 'assets/images/kategori1.png'),
        CardProductHorizontal(
            titles: 'Minimalist Table',
            price: 34,
            imgURL: 'assets/images/kategori2.png'),
        CardProductHorizontal(
            titles: 'Handsome Blue Chair',
            price: 1000,
            imgURL: 'assets/images/kategori3.png'),
        CardProductHorizontal(
            titles: 'Super Gray Chair',
            price: 34,
            imgURL: 'assets/images/kategori1.png'),
        CardProductHorizontal(
            titles: 'Minimalist Table',
            price: 34,
            imgURL: 'assets/images/kategori2.png'),
        CardProductHorizontal(
            titles: 'Handsome Blue Chair',
            price: 1000,
            imgURL: 'assets/images/kategori3.png'),
      ],
    );
  }
}
