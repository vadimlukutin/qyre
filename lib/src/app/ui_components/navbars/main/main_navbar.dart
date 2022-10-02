import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_horizontal/date_horizontal_list_item_widget.dart';

class MainNavBarHeader extends StatefulWidget {
  static const double offsetHeight = 111.0;
  static const double minHeaderHeight = 75.0;
  static const double maxHeaderHeight = 130.0;

  final ValueNotifier<bool> valueNotifier;

  const MainNavBarHeader({
    key,
    required this.title,
    required this.valueNotifier,
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

    widget.valueNotifier.addListener(refresh);
  }

  @override
  void dispose() {
    _containerAnimation.dispose();
    _calendarAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDisplayCalendar = widget.valueNotifier.value;

    final calendar = AnimatedBuilder(
      animation: _calendarAnimation,
      child: _getCalendarHeaderHorizontalList(),
      builder: (BuildContext context, Widget? child) {
        return ClipRect(
          child: SizedBox(
            height: _calendarAnimation.value,
            child: child,
          ),
        );
      },
    );

    return AnimatedBuilder(
      animation: _containerAnimation,
      child: SizedBox(
        width: double.infinity,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7.0,
              sigmaY: 7.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.0,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRect(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.matterBlack1s18h100w600,
                      ),
                      calendar
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          height: _containerAnimation.value == 0
              ? MainNavBarHeader.minHeaderHeight
              : _containerAnimation.value,
          child: child,
        );
      },
    );
  }

  void refresh() {
    const duration = Duration(milliseconds: 500);
    const curve = Curves.linear;

    isDisplayCalendar = widget.valueNotifier.value;

    if (isDisplayCalendar) {
      _containerAnimation.animateTo(
        MainNavBarHeader.maxHeaderHeight,
        duration: duration,
        curve: curve,
      );
      _calendarAnimation.animateTo(
        55.0,
        duration: duration,
        curve: curve,
      );
    } else {
      _containerAnimation.animateTo(
        MainNavBarHeader.minHeaderHeight,
        duration: duration,
        curve: curve,
      );
      _calendarAnimation.animateTo(
        0.0,
        duration: duration,
        curve: curve,
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
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
      ),
    );
  }
}
