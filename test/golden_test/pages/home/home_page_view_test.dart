import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/pages/home/home_page_view.dart';

void main() {
  group('Profile list item view golden test group\'s', () {
    testGoldens('Profile list item view golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        HomePageView(),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(390.0, 1400.0),
      );
      await screenMatchesGolden(tester, 'home_page', autoHeight: true);
    });
  });
}
