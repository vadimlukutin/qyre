import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_components/list_items/profile/profile_list_item_view.dart';

void main() {
  group('Profile list item view golden test group\'s', () {
    testGoldens('Profile list item view golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ProfileListItemView(),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 140.0),
      );
      await screenMatchesGolden(tester, 'profile_list_item_view_today', autoHeight: true);
    });
  });
}
