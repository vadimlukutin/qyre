import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';

enum DateItemIndicatorType { none, blue, red }

abstract class DateBaseListItemView extends StatelessWidget {
  final bool isToday;
  final String? weekDay;
  final String? month;
  final String? day;
  final DateItemIndicatorType type;

  static const today = 'TODAY';

  const DateBaseListItemView({
    this.isToday = false,
    this.type = DateItemIndicatorType.none,
    this.weekDay,
    this.month,
    this.day,
    Key? key,
  }) : super(key: key);

  Color? getColorType(DateItemIndicatorType type) {
    switch (type) {
      case DateItemIndicatorType.blue:
        return AppColors.blueFaded12;
      case DateItemIndicatorType.red:
        return AppColors.redBright18;
      case DateItemIndicatorType.none:
        return null;
    }
  }
}
