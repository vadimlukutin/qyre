import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_components/base/vertical_list_item/base_list_item_widget.dart';
import 'package:qyre/src/app/ui_kit/list_items/title/title_list_item_widget.dart';

class TitleListItemView extends BaseVerticalListItemWidget {
  final String? text;

  const TitleListItemView({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildItem(BuildContext context) {
    return TitleListItemWidget(text: text);
  }
}
