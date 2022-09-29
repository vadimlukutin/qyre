import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class TitleListItemWidget extends StatelessWidget {
  final String? text;

  const TitleListItemWidget({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text ?? '',
          textAlign: TextAlign.left,
          style: AppTextStyles.matterBlack3s18h100w600,
        ),
      ),
    );
  }
}
