import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_horizontal/date_horizontal_list_item_widget.dart';

void main() {
  group('Horizontal date list item widget golden test group\'s', () {
    testGoldens('Horizontal date list item widget golden test', (tester) async {
      const day = '18';
      const month = 'Oct.';
      const weekDay = 'Mon';
      const surfaceHeight = 36.0;

      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemWidget(
          isToday: true,
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(75.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_widget_today', autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(58.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_widget_red_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.blue,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(58.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_widget_blue_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(48.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_widget_none_type',
          autoHeight: true);
    });
  });
}
