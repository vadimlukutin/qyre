import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/title/title_list_item_widget.dart';

void main() {
  group('Title list item widget golden test group\'s', () {
    testGoldens('Title list item widget golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const TitleListItemWidget(text: 'Today\'s productions'),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 44.0),
      );
      await screenMatchesGolden(tester, 'title_list_item_widget', autoHeight: true);
    });
  });
}
