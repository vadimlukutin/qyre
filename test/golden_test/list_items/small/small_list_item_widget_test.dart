import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/small/small_list_item_widget.dart';

void main() {
  group('Small list item widget golden test group\'s', () {
    testGoldens('Small list item widget golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ColoredBox(
          color: Colors.black,
          child: SmallListItemWidget(
            title: 'What has bee seen very very long text',
            country: 'Sweden',
            date: 'Jan 14, 2022 - Feb 23, 2023',
          ),
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 70.0),
      );
      await screenMatchesGolden(tester, 'small_list_item_widget', autoHeight: true);
    });
  });
}
