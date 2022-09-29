import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/profile/profile_list_item_widget.dart';

void main() {
  group('Profile list item widget golden test group\'s', () {
    testGoldens('Profile list item widget golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ProfileListItemWidget(),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 140.0),
      );
      await screenMatchesGolden(tester, 'profile_list_item_widget', autoHeight: true);
    });
  });
}
