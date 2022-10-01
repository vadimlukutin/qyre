import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_horizontal/date_horizontal_list_item_widget.dart';

class MainNavBarHeader extends StatelessWidget {
  const MainNavBarHeader({
    key,
    required this.title,
    required this.isDisplayCalendar,
  }) : super(key: key);

  final String title;
  final bool isDisplayCalendar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 7.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.matterBlack1s18h100w600,
                      ),
                      ...isDisplayCalendar ? [_getCalendarHeaderHorizontalList()] : [],
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCalendarHeaderHorizontalList() {
    const day = '18';
    const month = 'Oct';
    const weekDay = 'Mon';

    const children = [
      DateHorizontalListItemWidget(
        isToday: true,
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.blue,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.blue,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateHorizontalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
    ];
    return SizedBox(
      height: 55.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10.0);
        },
      ),
    );
  }
}
