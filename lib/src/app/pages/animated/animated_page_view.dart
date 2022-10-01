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

  bool _sliverCalendarHidden = false;

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
  }

  @override
  void dispose() {
    _maxExtentAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headerHeight =
        !_sliverCalendarHidden ? AnimatedPage.minHeaderHeight : AnimatedPage.maxHeaderHeight;

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
                  isDisplayCalendar: _sliverCalendarHidden,
                  minExtent: headerHeight,
                  maxExtent: headerHeight,
                ),
              );
            }),
        SliverList(
          delegate: SliverChildListDelegate(widget.children),
        ),
      ],
    );
  }

  void _scrollListener() {
    const duration = Duration(milliseconds: 200);
    const curve = Curves.linear;
    const delta = AnimatedPage.maxHeaderHeight - AnimatedPage.minHeaderHeight;

    if (_scrollController.offset - AnimatedPage.offsetHeight <=
        _scrollController.position.minScrollExtent) {
      if (!_sliverCalendarHidden) {
        return;
      }

      setState(() {
        _sliverCalendarHidden = false;
        _maxExtentAnimation.animateTo(
          AnimatedPage.minHeaderHeight,
          duration: duration,
          curve: curve,
        );
        _scrollController.animateTo(
          _scrollController.offset - AnimatedPage.offsetHeight,
          duration: duration,
          curve: curve,
        );
      });
    } else {
      if (_sliverCalendarHidden) {
        return;
      }
      setState(() {
        _sliverCalendarHidden = true;
        _maxExtentAnimation.animateTo(
          AnimatedPage.maxHeaderHeight,
          duration: duration,
          curve: curve,
        );
        _scrollController.animateTo(
          _scrollController.offset + delta,
          duration: duration,
          curve: curve,
        );
      });
    }
  }
}
