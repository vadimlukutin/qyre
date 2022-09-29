import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_components/base/vertical_list_item/base_list_item_widget.dart';
import 'package:qyre/src/app/ui_kit/list_items/post/post_list_item_widget.dart';

class PostListItemView extends BaseVerticalListItemWidget {
  final String? title;
  final String? subtitle;
  final String? date;
  final String? text;

  final GestureTapCallback? listOnTap;
  final GestureTapCallback? imageOnTap;
  final GestureTapCallback? pinOnTap;

  const PostListItemView({
    this.title,
    this.subtitle,
    this.date,
    this.text,
    this.listOnTap,
    this.imageOnTap,
    this.pinOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildItem(BuildContext context) {
    return PostListItemWidget(
      title: title,
      subtitle: subtitle,
      date: date,
      text: text,
      listOnTap: listOnTap,
      imageOnTap: imageOnTap,
      pinOnTap: pinOnTap,
    );
  }
}
