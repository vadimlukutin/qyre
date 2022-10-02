import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_horizontal/date_horizontal_list_item_widget.dart';

class MainNavBarHeader extends StatefulWidget {
  static const double offsetHeight = 111.0;
  static const double minHeaderHeight = 75.0;
  static const double maxHeaderHeight = 130.0;

  const MainNavBarHeader({
    key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return MainNavBarHeaderState();
  }
}

class MainNavBarHeaderState extends State<MainNavBarHeader> with TickerProviderStateMixin {
  bool isDisplayCalendar = false;
  late AnimationController _containerAnimation;
  late AnimationController _calendarAnimation;

  @override
  void initState() {
    super.initState();

    _containerAnimation = AnimationController.unbounded(
      vsync: this,
    );
    _calendarAnimation = AnimationController.unbounded(
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(MainNavBarHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _containerAnimation.dispose();
    _calendarAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        isDisplayCalendar ? MainNavBarHeader.maxHeaderHeight : MainNavBarHeader.minHeaderHeight;

    return AnimatedBuilder(
      animation: _containerAnimation,
      child: SizedBox(
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
                          widget.title,
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
      ),
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          height: height,
          child: child,
        );
      },
    );
  }

  void refresh(bool isDisplayCalendar) {
    const duration = Duration(milliseconds: 5000);
    const curve = Curves.linear;

    if (isDisplayCalendar == this.isDisplayCalendar) {
      return;
    }

    this.isDisplayCalendar = isDisplayCalendar;

    if (isDisplayCalendar) {
      setState(
        () {
          _calendarAnimation.animateTo(
            MainNavBarHeader.maxHeaderHeight,
            duration: duration,
            curve: curve,
          );
          _containerAnimation.animateTo(
            MainNavBarHeader.maxHeaderHeight,
            duration: duration,
            curve: curve,
          );
        },
      );
    } else {
      setState(
        () {
          _calendarAnimation.animateTo(
            MainNavBarHeader.minHeaderHeight,
            duration: duration,
            curve: curve,
          );
          _containerAnimation.animateTo(
            MainNavBarHeader.minHeaderHeight,
            duration: duration,
            curve: curve,
          );
        },
      );
    }
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
