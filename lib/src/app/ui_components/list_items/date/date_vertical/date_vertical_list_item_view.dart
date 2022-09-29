import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_vertical/date_vertical_list_item_widget.dart';

class DateVerticalListItemView extends DateBaseListItemWidget {
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
    return DateVerticalListItemWidget(
      isToday: isToday,
      type: type,
      weekDay: weekDay,
      month: month,
      day: day,
    );
  }
}
