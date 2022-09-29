import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class OfferListItemWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? date;
  final String? datePeriod;
  final String? timeDelta;

  const OfferListItemWidget({
    this.title,
    this.subtitle,
    this.date,
    this.datePeriod,
    this.timeDelta,
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
                  Text(
                    subtitle ?? '',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.matterBlack3s16h120w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        datePeriod ?? '',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.matterBlack5s12h130w500,
                      ),
                      Text(
                        timeDelta ?? '',
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.matterBlack5s12h130w500,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
