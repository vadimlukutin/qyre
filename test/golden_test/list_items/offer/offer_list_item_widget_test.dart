import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_kit/list_items/offer/offer_list_item_widget.dart';

void main() {
  group('Offer list item widget golden test group\'s', () {
    testGoldens('Offer list item widget golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ColoredBox(
          color: Colors.black,
          child: OfferListItemWidget(
            title: 'Boom operator',
            subtitle: 'Master chef',
            date: 'Jun 12, 2021',
            datePeriod: 'Jan 14, 2022 - Feb 23, 2022',
            timeDelta: '3 days',
          ),
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 93.0),
      );
      await screenMatchesGolden(tester, 'offer_list_item_widget', autoHeight: true);
    });
  });
}
