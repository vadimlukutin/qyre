import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_components/list_items/title/title_list_item_view.dart';

void main() {
  group('Title list item view golden test group\'s', () {
    testGoldens('Title list item view golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const TitleListItemView(text: 'Today\'s productions'),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 44.0),
      );
      await screenMatchesGolden(tester, 'title_list_item_view', autoHeight: true);
    });
  });
}
