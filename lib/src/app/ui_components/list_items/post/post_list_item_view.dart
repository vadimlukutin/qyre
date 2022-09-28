import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/generated/assets.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class PostListItemView extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? date;
  final String? text;

  final GestureTapCallback? listOnTap;
  final GestureTapCallback? imageOnTap;
  final GestureTapCallback? pinOnTap;

  const PostListItemView({
    this.title,
    this.subtitle,
    this.date,
    this.text,
    this.listOnTap,
    this.imageOnTap,
    this.pinOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 93.0;
    const borderRadius = 4.0;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.gray9,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: SizedBox(
        height: itemHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.matterBlack3s16h120w600,
                  ),
                  Text(
                    date ?? '',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.matterBlack5s12h130w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white10,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        subtitle ?? '',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.matterBlack3s16h120w600,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _buildButton(imagePath: Assets.iconsQyre, onTap: listOnTap),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _buildButton(imagePath: Assets.iconsQyre, onTap: imageOnTap),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _buildButton(imagePath: Assets.iconsQyre, onTap: pinOnTap),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      text ?? '',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: AppTextStyles.matterBlack5s15h130w500,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    String imagePath = Assets.iconsQyre,
    GestureTapCallback? onTap,
  }) {
    const imageSize = Size(24.0, 24.0);

    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        imagePath,
        height: imageSize.height,
        width: imageSize.width,
        color: AppColors.blueFaded12,
      ),
    );
  }
}
