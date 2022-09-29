import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_components/base/vertical_list_item/base_list_item_widget.dart';
import 'package:qyre/src/app/ui_kit/list_items/small/small_list_item_widget.dart';

class SmallListItemView extends BaseVerticalListItemWidget {
  final String? imagePath;
  final String? title;
  final String? country;
  final String? date;

  const SmallListItemView({
    this.imagePath,
    this.title,
    this.country,
    this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildItem(BuildContext context) {
    return SmallListItemWidget(
      imagePath: imagePath,
      title: title,
      country: country,
      date: date,
    );
  }
}
