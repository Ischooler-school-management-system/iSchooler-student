import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/widgets/generic_drop_down_widget.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../weekday/data/models/weekday_model.dart';
import '../../../weekday/logic/cubit/weekday_cubit.dart';
import '../../../weekly_session/data/models/weekly_sessions_list_model.dart';
import '../../../weekly_session/logic/cubit/weekly_sessions_cubit.dart';
import '../../data/models/weekly_timetable_model.dart';

class TimeTableLoadedView extends StatefulWidget {
  final WeeklyTimetableModel timeTable;

  const TimeTableLoadedView({super.key, required this.timeTable});

  @override
  State<TimeTableLoadedView> createState() => _TimeTableLoadedViewState();
}

class _TimeTableLoadedViewState extends State<TimeTableLoadedView> {
  WeekdayModel selectedWeekday = WeekdayModel.empty();
  // WeekdaysListModel weekdaysListModel = WeekdaysListModel.empty();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'time_table_loaded_view > ',
      developer: "Ziad",
    );
    return BlocBuilder<WeeklySessionsCubit, WeeklySessionsState>(
      builder: (context, state) {
        WeeklySessionsListModel weeklySessionsListModel =
            WeeklySessionsListModel.empty();
        if (state.status == IschoolerStatus.loaded &&
            state.educonnectAllModel is WeeklySessionsListModel) {
          weeklySessionsListModel =
              state.educonnectAllModel as WeeklySessionsListModel;
          weeklySessionsListModel = weeklySessionsListModel.setSessionsTiming(
              timeTable: widget.timeTable);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GenericDropDownWidget<WeekdaysCubit>(
                onChanged: onWeekdaySelected,
                hint: 'select a day',
              ),
              if (selectedWeekday.isDayOff) ...{
                Expanded(
                  child: Center(
                    child: Text(selectedWeekday.name != ''
                        ? '${selectedWeekday.name} is Day off'
                        : 'No day selected'),
                  ),
                )
              }
            ],
          ),
        );
      },
    );
  }

  onWeekdaySelected(weekday) async {
    Madpoly.print(
      'weekday = $weekday',
      tag: 'time_table_loaded_view > ',
      developer: "Ziad",
    );
    if (weekday is WeekdayModel) {
      selectedWeekday = weekday;
      context.read<WeeklySessionsCubit>().getAllItems(
            classId: widget.timeTable.id,
            weekdayId: selectedWeekday.id,
          );
      setState(() {});
    }
  }
}
