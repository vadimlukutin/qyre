import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_components/list_items/date/date_base.dart';

class DateVerticalListItemView extends DateBaseListItemView {
  const DateVerticalListItemView({
    bool isToday = false,
    DateItemIndicatorType type = DateItemIndicatorType.none,
    String? weekDay,
    String? month,
    String? day,
    Key? key,
  }) : super(
          isToday: isToday,
          type: type,
          weekDay: weekDay,
          month: month,
          day: day,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    const borderRadius = 4.0;
    const width = 62.0;

    return UnconstrainedBox(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.black1,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ...isToday
                    ? [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            DateBaseListItemView.today,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: AppTextStyles.matterGray6s10h100w600,
                          ),
                        )
                      ]
                    : [],
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Column(
                    children: [
                      Text(
                        weekDay ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                          height: 1.3,
                          color: AppColors.white10,
                          fontFamily: AppTextStyles.matter,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        month ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: AppTextStyles.matterWhite10h100w500,
                      ),
                      Text(
                        day ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: AppTextStyles.matterWhite10s16h120w700,
                      ),
                    ],
                  ),
                ),
                ...type == DateItemIndicatorType.none
                    ? []
                    : [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: getColorType(type) ?? AppColors.white10,
                              borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                            ),
                            child: const SizedBox.square(
                              dimension: borderRadius * 2,
                            ),
                          ),
                        )
                      ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
