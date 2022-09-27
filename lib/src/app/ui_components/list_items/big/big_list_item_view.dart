import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/generated/assets.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class BigListItemView extends StatelessWidget {
  final String? title;
  final String? moreTitle;
  final double value;
  final GestureTapCallback? onTap;

  const BigListItemView({
    this.value = 0.5,
    this.title,
    this.moreTitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemSize = Size(300.0, 136.0);
    const borderRadius = 4.0;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: itemSize.width,
        height: itemSize.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.gray9,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: AppColors.black3,
                    fontFamily: AppFontFamilies.matter,
                    fontSize: 16,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                LinearProgressIndicator(
                  value: value,
                  minHeight: 9.0,
                  color: AppColors.blueFaded12,
                  backgroundColor: AppColors.white10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        moreTitle ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: AppColors.black1,
                          fontFamily: AppFontFamilies.matter,
                          height: 1.2,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.iconsNext,
                      width: 10.0,
                      height: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
