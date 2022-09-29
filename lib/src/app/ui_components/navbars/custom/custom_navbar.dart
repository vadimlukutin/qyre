import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';

class CustomNavBar extends SliverPersistentHeaderDelegate {
  final String title;

  CustomNavBar({required this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (kDebugMode) {
      print('shrinkOffset = $shrinkOffset');
    }
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 7.0,
          sigmaY: 7.0,
        ),
        child: SizedBox(
          width: double.infinity,
          height: shrinkOffset < 100 ? 200.0 : 130,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: AppTextStyles.matterBlack3s18h100w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration();
}
