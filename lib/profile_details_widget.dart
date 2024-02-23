import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ischooler/common/educonnect_constants.dart';

import 'common/style/educonnect_colors.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.w,
              // vertical: 24.w,
            ),
            child: const Text(
              // 'Student Detail',
              'بيانات الطالب',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 12.w,
            ),
            // height: 150.h,
            decoration: BoxDecoration(
              // color: IschoolerColors.white,
              border: Border.all(
                color: IschoolerColors.grey.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            // alignment: Alignment.bottomCenter,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    /// date of birth
                    detailsRowWidget(
                      IschoolerConstants.localization().date_of_birth,
                      "01/01/1990",
                    ),

                    /// class
                    detailsRowWidget(
                      IschoolerConstants.localization().classes,
                      "10th",
                    ),

                    /// Roll Number
                    detailsRowWidget(
                      IschoolerConstants.localization().roll_number,
                      "A12345",
                    ),

                    /// Phone Number
                    detailsRowWidget(
                      IschoolerConstants.localization().phone_number,
                      "+1234567890",
                    ),

                    /// Father Name
                    detailsRowWidget(
                      IschoolerConstants.localization().fathers_name,
                      "John Doe",
                    ),

                    /// Address
                    detailsRowWidget(
                      IschoolerConstants.localization().address,
                      "123 Main St, City, Country",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsRowWidget(String data, String data2) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
          vertical: 10.0.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: const TextStyle(
                fontSize: 16,
                // color: IschoolerColors.lightBlack,
              ),
            ),
            Text(
              data2,
              style: const TextStyle(
                fontSize: 16,
                // color: IschoolerColors.lightBlack,
              ),
            ),
          ],
        ));
  }
}
