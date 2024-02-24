import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/common_features/widgets/buttons/educonnect_button.dart';
import 'common/common_features/widgets/buttons/models/buttons_model.dart';
import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/educonnect_constants.dart';
import 'common/style/educonnect_colors.dart';
import 'features/dashboard/logic/cubit/educonnect_cubit.dart';
import 'features/profile/students/data/models/student_model.dart';
import 'features/profile/students/logic/cubit/student_cubit.dart';
import 'profile_details_widget.dart';
import 'profile_overview_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
        appBar: AppBar(
          backgroundColor: IschoolerColors.blue,
          foregroundColor: IschoolerColors.white,
          title: Text(
            IschoolerConstants.localization().profile,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IschoolerButton(
            button: IschoolerIconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ),
        ),
        body: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            StudentModel studentData = StudentModel.empty();
            if (state.status == IschoolerStatus.loaded &&
                state.ischoolerModel is StudentModel) {
              studentData = state.ischoolerModel as StudentModel;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileOverviewWidget(studentData: studentData),
                ProfileDetailsWidget(studentData: studentData),
              ],
            );
          },
        ));
  }
}
