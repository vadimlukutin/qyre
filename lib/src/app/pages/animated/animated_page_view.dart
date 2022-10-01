import 'package:flutter/cupertino.dart';
import 'package:qyre/src/app/ui_components/navbars/main/main_navbar.dart';

class AnimatedPage extends StatefulWidget {
  final List<Widget> children;
  static const double offsetHeight = 111.0;
  static const double minHeaderHeight = 75.0;
  static const double maxHeaderHeight = 130.0;

  const AnimatedPage({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> with TickerProviderStateMixin {
  late AnimationController _maxExtentAnimation;
  late ScrollController _scrollController;

  bool sliverCalendarHidden = false;
  @override
  void initState() {
    super.initState();
    _maxExtentAnimation = AnimationController.unbounded(
      vsync: this,
      value: AnimatedPage.minHeaderHeight,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didUpdateWidget(AnimatedPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (sliverCalendarHidden) {
      _maxExtentAnimation.animateTo(
        AnimatedPage.maxHeaderHeight,
        duration: const Duration(milliseconds: 200),
        //curve: Curves.slowMiddle,
      );
    } else {
      _maxExtentAnimation.animateTo(
        AnimatedPage.minHeaderHeight,
        duration: const Duration(milliseconds: 200),
        //curve: Curves.slowMiddle,
      );
    }
  }

  @override
  void dispose() {
    _maxExtentAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headerHeight =
        !sliverCalendarHidden ? AnimatedPage.minHeaderHeight : AnimatedPage.maxHeaderHeight;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        AnimatedBuilder(
            animation: _maxExtentAnimation,
            builder: (context, child) {
              return SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: MainNavBarHeaderDelegate(
                  title: 'Today\'s productions',
                  isDisplayCalendar: sliverCalendarHidden,
                  minExtent: headerHeight,
                  maxExtent: headerHeight,
                ),
              );
            }),
        SliverList(delegate: SliverChildListDelegate(widget.children)),
      ],
    );
  } // Listening for user scroll on screen.

  void _scrollListener() {
    if (_scrollController.offset - AnimatedPage.offsetHeight <=
        _scrollController.position.minScrollExtent) {
      setState(() {
        sliverCalendarHidden = false;
      });
    } else {
      setState(() {
        sliverCalendarHidden = true;
      });
    }
  }
}
