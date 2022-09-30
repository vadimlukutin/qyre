import 'package:flutter/cupertino.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/pages/animated/animated_page_view.dart';
import 'package:qyre/src/app/ui_components/list_items/big/big_list_item_view.dart';
import 'package:qyre/src/app/ui_components/list_items/offer/offer_list_item_view.dart';
import 'package:qyre/src/app/ui_components/list_items/post/post_list_item_view.dart';
import 'package:qyre/src/app/ui_components/list_items/profile/profile_list_item_view.dart';
import 'package:qyre/src/app/ui_components/list_items/small/small_list_item_view.dart';
import 'package:qyre/src/app/ui_components/list_items/title/title_list_item_view.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_base.dart';
import 'package:qyre/src/app/ui_kit/list_items/date/date_vertical/date_vertical_list_item_widget.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      _getCalendarHorizontalList(),
      const SizedBox(height: 10.0),
      _getHorizontalList(),
      const TitleListItemView(text: 'Today\'s productions'),
      const SmallListItemView(
        title: 'Production Name That is Long',
        country: 'Sweden',
        date: 'Jan 14, 2022 - Feb 23, 2023',
      ),
      const SmallListItemView(
        title: 'What has bee seen very very long text',
        country: 'Sweden',
        date: 'Jan 14, 2022 - Feb 23, 2023',
      ),
      const TitleListItemView(text: 'My job offers'),
      const ProfileListItemView(),
      const OfferListItemView(
        title: 'Boom operator',
        subtitle: 'Master chef',
        date: 'Jun 12, 2021',
        datePeriod: 'Jan 14, 2022 - Feb 23, 2022',
        timeDelta: '3 days',
      ),
      const OfferListItemView(
        title: 'Boom operator',
        subtitle: 'Master chef',
        date: 'Jun 12, 2021',
        datePeriod: 'Jan 14, 2022 - Feb 23, 2022',
        timeDelta: '3 days',
      ),
      const TitleListItemView(text: 'Starred posts'),
      const PostListItemView(
        title: 'Qyre US Production',
        subtitle: 'Updated privileges for current',
        date: '1 day ago',
        text:
            'I changed your admin roles to posters. With that you can’t send out offers. Just use the communication tool to get all the features!',
      ),
    ];

    return CupertinoPageScaffold(
      backgroundColor: AppColors.white10,
      child: SafeArea(
        child: AnimatedPage(
          children: children,
        ),
      ),
    );
  }

  Widget _getHorizontalList() {
    const children = [
      SizedBox(width: 16.0),
      BigListItemView(
        title: 'Complete your profile to optimize \nyour exposure in job searches.',
        moreTitle: 'Complete profile',
      ),
      BigListItemView(
        title: 'Complete your profile to optimize \nyour exposure in job searches.',
        moreTitle: 'Complete profile',
      ),
      BigListItemView(
        title: 'Complete your profile to optimize \nyour exposure in job searches.',
        moreTitle: 'Complete profile',
      ),
      SizedBox(width: 16.0)
    ];
    return SizedBox(
      height: 136.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          if (index == 0 || index == children.length - 2) {
            return const SizedBox.shrink();
          }

          return const SizedBox(width: 10.0);
        },
      ),
    );
  }

  Widget _getCalendarHorizontalList() {
    const day = '18';
    const month = 'Oct';
    const weekDay = 'Mon';

    const children = [
      SizedBox(width: 16.0),
      DateVerticalListItemWidget(
        isToday: true,
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.blue,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.blue,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
        type: DateItemIndicatorType.red,
      ),
      DateVerticalListItemWidget(
        day: day,
        month: month,
        weekDay: weekDay,
      ),
      SizedBox(width: 16.0)
    ];
    return SizedBox(
      height: 111.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          if (index == 0 || index == children.length - 2) {
            return const SizedBox.shrink();
          }

          return const SizedBox(width: 10.0);
        },
      ),
    );
  }
}
