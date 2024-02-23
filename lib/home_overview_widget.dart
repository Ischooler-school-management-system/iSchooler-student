import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ischooler/common/educonnect_assets.dart';
import 'package:ischooler/common/style/educonnect_colors.dart';

class HomeOverviewWidget extends StatelessWidget {
  const HomeOverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      height: 120.h,
      margin: const EdgeInsets.symmetric(
        // horizontal: 20.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: IschoolerColors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 12.0,
        //   vertical: 8.0,
        // ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Surya',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: const Text(
                'Class XI-B | Roll no: 04',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              trailing: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  IschoolerAssets.blankProfileImage,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'over all progress',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  '80%',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: LinearProgressIndicator(
                value: 0.6,
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
                backgroundColor: Colors.grey,
              ),
            ),
            // const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}
