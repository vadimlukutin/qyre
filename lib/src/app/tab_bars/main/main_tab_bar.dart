import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qyre/src/app/extra/resources/colors.dart';
import 'package:qyre/src/app/extra/resources/text_styles.dart';
import 'package:qyre/src/app/pages/home/home_page_view.dart';

class MainCupertinoTabBar extends StatelessWidget {
  const MainCupertinoTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        iconSize: 20.0,
        height: 75.0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: AppColors.white10,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_bullet,
              color: AppColors.white10,
            ),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(
                  CupertinoIcons.bell,
                  color: AppColors.white10,
                ),
                Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(Icons.brightness_1, size: 14.0, color: AppColors.redBright18),
                      Center(
                        child: Text(
                          '2',
                          style: AppTextStyles.matterWhite10s10h100w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return const HomePageView();
              default:
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white10,
                  ),
                  child: Center(
                    child: Text('Content of tab ${index + 1}'),
                  ),
                );
            }
          },
        );
      },
    );
  }
}
