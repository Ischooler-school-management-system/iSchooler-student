import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ischooler/home_shortcut_button.dart';

import 'common/common_features/widgets/buttons/educonnect_button_export.dart';
import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/style/educonnect_colors.dart';
import 'home_overview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
        appBar: AppBar(
          backgroundColor: IschoolerColors.blue,
          foregroundColor: IschoolerColors.white,
          title: const Text('ISCHOOLER'),
          centerTitle: true,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          // vertical: 24.0,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeOverviewWidget(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeShortcutButton(
                  title: 'timetable',
                  icon:
                      Icon(Icons.calendar_month_outlined, color: Colors.white),
                ),
                HomeShortcutButton(
                  title: 'timetable',
                  icon:
                      Icon(Icons.calendar_month_outlined, color: Colors.white),
                ),
                HomeShortcutButton(
                  title: 'timetable',
                  icon:
                      Icon(Icons.calendar_month_outlined, color: Colors.white),
                ),
                HomeShortcutButton(
                  title: 'timetable',
                  icon:
                      Icon(Icons.calendar_month_outlined, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Updates',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              // alignment: Alignment.bottomCenter,
              height: 45.h,
              // width: 45.h,
              margin: const EdgeInsets.symmetric(
                // horizontal: 20.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: IschoolerColors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        // color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Homework updated',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    IschoolerButton(
                      button: IschoolerTextButton(
                        onPressed: () {},
                        textButton: 'Check Now >',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
