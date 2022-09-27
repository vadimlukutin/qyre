import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_components/list_items/big/big_list_item_view.dart';

void main() {
  group('Small list item view golden test group\'s', () {
    testGoldens('Small list item view golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ColoredBox(
          color: Colors.black,
          child: BigListItemView(
            title: 'Complete your profile to optimize \nyour exposure in job searches.',
            moreTitle: 'Complete profile',
          ),
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(300.0, 136.0),
      );
      await screenMatchesGolden(tester, 'small_list_item_view', autoHeight: true);
    });
  });
}
