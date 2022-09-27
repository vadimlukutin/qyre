import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_components/list_items/date_horizontal/date_horizontal_list_item_view.dart';

void main() {
  group('Vertical date list item view golden test group\'s', () {
    testGoldens('Vertical date list item view golden test', (tester) async {
      const day = '18';
      const month = 'Oct.';
      const weekDay = 'Mon';
      const surfaceHeight = 36.0;

      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemView(
          isToday: true,
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(75.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_view_today', autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemView(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.red,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(58.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_view_red_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemView(
          day: day,
          month: month,
          weekDay: weekDay,
          type: DateItemIndicatorType.blue,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(58.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_view_blue_type',
          autoHeight: true);

      await tester.pumpWidgetBuilder(
        const DateHorizontalListItemView(
          day: day,
          month: month,
          weekDay: weekDay,
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(48.0, surfaceHeight),
      );
      await screenMatchesGolden(tester, 'date_horizontal_list_item_view_none_type',
          autoHeight: true);
    });
  });
}
