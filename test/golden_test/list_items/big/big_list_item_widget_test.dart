import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/big/big_list_item_widget.dart';

void main() {
  group('Big list item widget golden test group\'s', () {
    testGoldens('Big list item widget golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ColoredBox(
          color: Colors.black,
          child: BigListItemWidget(
            title: 'Complete your profile to optimize \nyour exposure in job searches.',
            moreTitle: 'Complete profile',
          ),
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(300.0, 136.0),
      );
      await screenMatchesGolden(tester, 'big_list_item_widget', autoHeight: true);
    });
  });
}
