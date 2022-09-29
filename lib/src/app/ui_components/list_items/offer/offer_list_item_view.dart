import 'package:flutter/material.dart';
import 'package:qyre/src/app/ui_components/base/vertical_list_item/base_list_item_widget.dart';
import 'package:qyre/src/app/ui_kit/list_items/offer/offer_list_item_widget.dart';

class OfferListItemView extends BaseVerticalListItemWidget {
  final String? title;
  final String? subtitle;
  final String? date;
  final String? datePeriod;
  final String? timeDelta;

  const OfferListItemView({
    this.title,
    this.subtitle,
    this.date,
    this.datePeriod,
    this.timeDelta,
    Key? key,
  }) : super(key: key);

  @override
  Widget buildItem(BuildContext context) {
    return OfferListItemWidget(
      title: title,
      subtitle: subtitle,
      date: date,
      datePeriod: datePeriod,
      timeDelta: timeDelta,
    );
  }
}
