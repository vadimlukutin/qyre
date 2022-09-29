import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';

class DateHorizontalListItemWidget extends DateBaseListItemWidget {
  const DateHorizontalListItemWidget({
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
    const height = 36.0;

    return UnconstrainedBox(
      child: SizedBox(
        height: height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.black1,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...isToday
                        ? [
                            const Padding(
                              padding: EdgeInsets.only(right: 2.0),
                              child: Text(
                                DateBaseListItemWidget.today,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: AppTextStyles.matterGray6s10h100w600,
                              ),
                            )
                          ]
                        : [],
                    Text(
                      weekDay ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: AppTextStyles.matterWhite10s12h130w500,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...type == DateItemIndicatorType.none
                        ? []
                        : [
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: getColorType(type) ?? AppColors.white10,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(borderRadius)),
                                ),
                                child: const SizedBox.square(
                                  dimension: borderRadius * 2,
                                ),
                              ),
                            )
                          ],
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Text(
                        day ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: AppTextStyles.matterWhite10s10h120w500,
                      ),
                    ),
                    Text(
                      month ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: AppTextStyles.matterWhite10s10h100w500,
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
