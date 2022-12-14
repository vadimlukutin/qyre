import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_kit//list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_horizontal/date_horizontal_list_item_widget.dart';

class DateHorizontalListItemView extends DateBaseListItemWidget {
  const DateHorizontalListItemView({
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
    return DateHorizontalListItemWidget(
      isToday: isToday,
      type: type,
      weekDay: weekDay,
      month: month,
      day: day,
    );
    ;
  }
}
