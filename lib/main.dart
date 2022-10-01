import 'package:flutter/cupertino.dart';
import 'package:qyre/src/app/tab_bars/main/main_tab_bar.dart';

//void main() => runApp(TestApp());

void main() {
  runApp(
    const CupertinoApp(
      title: 'Qyre',
      home: MainCupertinoTabBar(),
    ),
  );
}
