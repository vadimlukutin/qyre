import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/generated/assets.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class SmallListItemView extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? country;
  final String? date;

  const SmallListItemView({
    this.imagePath,
    this.title,
    this.country,
    this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageSize = Size(70.0, 70.0);
    const itemHeight = 70.0;
    const borderRadius = 4.0;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.gray9,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: SizedBox(
        height: itemHeight,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(borderRadius)),
              child: imagePath == null
                  ? SvgPicture.asset(
                      Assets.iconsQyre,
                      width: imageSize.width,
                      height: imageSize.height,
                      color: AppColors.black5,
                    )
                  : Image.network(
                      imagePath ?? '',
                      width: imageSize.width,
                      height: imageSize.height,
                    ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: AppColors.black3,
                              fontFamily: AppFontFamilies.matter,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Text(
                                  country ?? '',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: AppColors.black3,
                                    fontFamily: AppFontFamilies.matter,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                date ?? '',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: AppColors.black3,
                                  fontFamily: AppFontFamilies.matter,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.iconsNext,
                      width: 10.0,
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
