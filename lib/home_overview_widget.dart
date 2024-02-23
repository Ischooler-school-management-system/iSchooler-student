import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ischooler/features/dashboard/logic/cubit/educonnect_cubit.dart';

import 'common/educonnect_assets.dart';
import 'common/style/educonnect_colors.dart';
import 'features/profile/students/data/models/student_model.dart';
import 'features/profile/students/logic/cubit/student_cubit.dart';

class HomeOverviewWidget extends StatefulWidget {
  const HomeOverviewWidget({
    super.key,
  });

  @override
  State<HomeOverviewWidget> createState() => _HomeOverviewWidgetState();
}

class _HomeOverviewWidgetState extends State<HomeOverviewWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<StudentCubit>()
        .getItem(id: '9ad3e27a-0815-4959-8c6d-a35c2d774be7');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        StudentModel studentData = StudentModel.empty();
        if (state.status == IschoolerStatus.loaded &&
            state.ischoolerModel is StudentModel) {
          studentData = state.ischoolerModel as StudentModel;
        }
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
                  title: Text(
                    'مرحبا ${studentData.name}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    '${studentData.classModel.grade.name} | ${studentData.classModel.name}',
                    style: const TextStyle(
                        color: IschoolerColors.darkWhite, fontSize: 16),
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
                      'التقدم',
                      style: TextStyle(
                          color: IschoolerColors.darkWhite, fontSize: 14),
                    ),
                    Text(
                      '80%',
                      style: TextStyle(
                          color: IschoolerColors.darkWhite, fontSize: 14),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: LinearProgressIndicator(
                    value: 0.8,
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
      },
    );
  }
}
