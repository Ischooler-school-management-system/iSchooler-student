import 'package:flutter/material.dart';

import 'calender_screen.dart';
import 'common/common_features/widgets/buttons/educonnect_button_export.dart';
import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/common_features/widgets/ischooler_navbar_item.dart';
import 'common/educonnect_constants.dart';
import 'common/madpoly.dart';
import 'common/style/educonnect_colors.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

// ischooler_bottom_navbar
class IschoolerBottomNavbar extends StatefulWidget {
  const IschoolerBottomNavbar({super.key});

  @override
  State<IschoolerBottomNavbar> createState() => _IschoolerBottomNavbarState();
}

class _IschoolerBottomNavbarState extends State<IschoolerBottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CalenderScreen(),
    const ProfileScreen(),
  ];

  List<({Widget icon, String title})> tabsData = [
    (
      icon: const Icon(Icons.home, color: Colors.white),
      title: IschoolerConstants.localization().home,
    ),
    (
      icon: const Icon(Icons.calendar_month_outlined, color: Colors.white),
      title: IschoolerConstants.localization().calender,
    ),
    (
      icon: const Icon(Icons.person, color: Colors.white),
      title: IschoolerConstants.localization().profile,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Madpoly.print('Building Screen',
        developer: 'ziad', tag: 'MawjoodBottomNavBar', isLog: true);

    return IschoolerScreen(
      body: Stack(
        children: [
          Positioned.fill(child: screens[_currentIndex]),
          Align(
            alignment: Alignment.bottomCenter,
            child: navBar(),
          ),
          // screens[_currentIndex],
        ],
      ),
    );
  }

  Container navBar() {
    return Container(
      // alignment: Alignment.bottomCenter,
      height: 60,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: IschoolerColors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabsData.asMap().entries.map((entry) {
          var e = entry.value;
          var index = entry.key;
          return IschoolerButton(
              button: IschoolerContainerButton(
            child: IschoolerNavbarItem(
              icon: e.icon,
              title: e.title,
              isSelected: index == _currentIndex,
            ),
            onPressed: () {
              _currentIndex = index;
              setState(() {});
            },
            color: (index == _currentIndex)
                ? IschoolerColors.white.withOpacity(0.2)
                : null,
            padding: const EdgeInsets.all(8),
            borderRadius: 30,
          ));
        }).toList(),
      ),
    );
  }
}
