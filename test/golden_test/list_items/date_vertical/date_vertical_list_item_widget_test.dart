import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_vertical/date_vertical_list_item_widget.dart';

void main() {
  group('Vertical date list item widget golden test group\'s', () {
    testGoldens('Vertical date list item widget golden test', (tester) async {
      const day = '18';
      const month = 'Oct';
      const weekDay = 'Mon';
      const surfaceWidth = 62.0;

      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const DateVerticalListItemWidget(
          isToday: true,
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(surfaceWidth, 111.0),
      );
      await screenMatchesGolden(tester, 'date_vertical_list_item_widget_today', autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateVerticalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(surfaceWidth, 95.0),
      );
      await screenMatchesGolden(tester, 'date_vertical_list_item_widget_red_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateVerticalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.blue,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(surfaceWidth, 95.0),
      );
      await screenMatchesGolden(tester, 'date_vertical_list_item_widget_blue_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateVerticalListItemWidget(
          day: day,
          month: month,
          weekDay: weekDay,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(surfaceWidth, 79.0),
      );
      await screenMatchesGolden(tester, 'date_vertical_list_item_widget_none_type',
          autoHeight: true);
    });
  });
}
