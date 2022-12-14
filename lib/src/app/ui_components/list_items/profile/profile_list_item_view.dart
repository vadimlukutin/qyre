import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_components/base/vertical_list_item/base_list_item_widget.dart';
import 'package:qyre/src/app/ui_kit/list_items/profile/profile_list_item_widget.dart';

class ProfileListItemView extends BaseVerticalListItemWidget {
  final GestureTapCallback? onMyNetworkTap;
  final GestureTapCallback? onQuickHireTap;
  final GestureTapCallback? onCvTap;

  const ProfileListItemView({
    this.onMyNetworkTap,
    this.onQuickHireTap,
    this.onCvTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildItem(BuildContext context) {
    return ProfileListItemWidget(
      onMyNetworkTap: onMyNetworkTap,
      onQuickHireTap: onQuickHireTap,
      onCvTap: onCvTap,
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

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: itemWidth,
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
