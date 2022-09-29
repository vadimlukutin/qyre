import 'package:flutter/material.dart';

abstract class BaseVerticalListItemWidget extends StatelessWidget {
  const BaseVerticalListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
      child: buildItem(context),
    );
  }

  @required
  Widget buildItem(BuildContext context);
}
