import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/educonnect_assets.dart';
import 'common/style/educonnect_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
        appBar: AppBar(
          backgroundColor: IschoolerColors.blue,
          foregroundColor: IschoolerColors.white,
          title: const Text('ISCHOOLER'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 220.h,
              child: Stack(
                children: [
                  Container(
                    // alignment: Alignment.bottomCenter,
                    height: 120.h,
                    decoration: const BoxDecoration(
                      color: IschoolerColors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 18.w,
                      ),
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: IschoolerColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, -0.6),
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(
                        IschoolerAssets.blankProfileImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
