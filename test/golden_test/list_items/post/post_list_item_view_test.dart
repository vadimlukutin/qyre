import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:qyre/src/app/ui_components/list_items/post/post_list_item_view.dart';

void main() {
  group('Post list item view golden test group\'s', () {
    testGoldens('Post list item view golden test', (tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(
        const ColoredBox(
          color: Colors.black,
          child: PostListItemView(
            title: 'Qyre US Production',
            subtitle: 'Updated privileges for current',
            date: '1 day ago',
            text:
                'I changed your admin roles to posters. With that you can’t send out offers. Just use the communication tool to get all the features!',
          ),
        ),
        wrapper: materialAppWrapper(platform: TargetPlatform.iOS),
        surfaceSize: const Size(358.0, 144.0),
      );
      await screenMatchesGolden(tester, 'post_list_item_view', autoHeight: true);
    });
  });
}
