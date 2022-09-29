import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_kit/list_items/big/big_list_item_widget.dart';

class BigListItemView extends StatelessWidget {
  final String? title;
  final String? moreTitle;
  final double value;
  final GestureTapCallback? onTap;

  const BigListItemView({
    this.value = 0.5,
    this.title,
    this.moreTitle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigListItemWidget(
      title: title,
      moreTitle: moreTitle,
      value: value,
      onTap: onTap,
    );
  }
}
