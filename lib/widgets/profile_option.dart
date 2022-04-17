import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class ProfileOption extends StatelessWidget {
  final String menu;
  final IconData preffixIcon;
  final IconData suffixIcon;
  final bool isLightMode;

  const ProfileOption({
    Key? key,
    required this.menu,
    required this.preffixIcon,
    required this.suffixIcon,
    required this.isLightMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          Icon(
            preffixIcon,
            size: 24,
            color: isLightMode ? kBlackColor : kWhiteColor,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            menu,
            style: isLightMode
                ? blackText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  )
                : whiteText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
          ),
          const Spacer(),
          Icon(
            suffixIcon,
            size: 24,
            color: kGrayColor,
          ),
        ],
      ),
    );
  }
}
