import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class TitleListItemView extends StatelessWidget {
  final String? text;

  const TitleListItemView({
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
          style: const TextStyle(
            color: AppColors.black3,
            fontFamily: AppFontFamilies.matter,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
