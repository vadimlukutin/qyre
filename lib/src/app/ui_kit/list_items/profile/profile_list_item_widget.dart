import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/generated/assets.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class ProfileListItemWidget extends StatelessWidget {
  final GestureTapCallback? onMyNetworkTap;
  final GestureTapCallback? onQuickHireTap;
  final GestureTapCallback? onCvTap;

  const ProfileListItemWidget({
    this.onMyNetworkTap,
    this.onQuickHireTap,
    this.onCvTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileSubItemView(
            imagePath: Assets.iconsUsersCouple,
            title: 'My network',
            text: 'Connect and grow \nyour network',
            beginGradientColor: AppColors.gradientBlue20b,
            endGradientColor: AppColors.gradientBlue20e,
            onTap: onMyNetworkTap,
          ),
          ProfileSubItemView(
            imagePath: Assets.iconsQyre,
            title: 'Quick hire',
            text: 'Hire someone \nquickly today',
            beginGradientColor: AppColors.gradientRed21b,
            endGradientColor: AppColors.gradientRed21e,
            onTap: onQuickHireTap,
          ),
          ProfileSubItemView(
            imagePath: Assets.iconsContract,
            title: 'My CV',
            text: 'Keep your CV \nupdated to get \nthe best offers',
            beginGradientColor: AppColors.gradientPurple22b,
            endGradientColor: AppColors.gradientPurple22e,
            onTap: onCvTap,
          ),
        ],
      ),
    );
  }
}

class ProfileSubItemView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String text;
  final Color beginGradientColor;
  final Color endGradientColor;
  final GestureTapCallback? onTap;

  const ProfileSubItemView({
    required this.imagePath,
    required this.title,
    required this.text,
    required this.beginGradientColor,
    required this.endGradientColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemWidth = 110.0;
    const borderRadius = 4.0;
    const imageHeight = 32.0;

    return SizedBox(
      width: itemWidth,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [beginGradientColor, endGradientColor],
            ),
            color: AppColors.gray9,
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    imagePath,
                    height: imageHeight,
                    color: AppColors.white10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.matterWhite10s14h100w700,
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.matterWhite10s10h100w500,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
