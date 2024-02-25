import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/common_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../../common/educonnect_model.dart';
import '../../../../../common/madpoly.dart';
import '../../../../dashboard/logic/cubit/educonnect_cubit.dart';
import '../../../weekday/data/models/weekday_model.dart';
import '../../../weekday/data/models/weekdays_list_model.dart';
import '../../../weekday/logic/cubit/weekday_cubit.dart';
import '../../../weekly_session/data/models/weekly_sessions_list_model.dart';
import '../../../weekly_session/logic/cubit/weekly_sessions_cubit.dart';
import '../../data/models/weekly_timetable_model.dart';
import '../widgets/day_table_widget.dart';

class TimeTableLoadedView extends StatefulWidget {
  final WeeklyTimetableModel timeTable;

  const TimeTableLoadedView({super.key, required this.timeTable});

  @override
  State<TimeTableLoadedView> createState() => _TimeTableLoadedViewState();
}

class _TimeTableLoadedViewState extends State<TimeTableLoadedView> {
  WeekdayModel? selectedWeekday;
  // WeekdaysListModel weekdaysListModel = WeekdaysListModel.empty();

  @override
  void initState() {
    super.initState();
    context.read<WeekdaysCubit>().getAllItems();
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
              // WeekdaysDropDownWidget(
              //   onChanged: onWeekdaySelected,
              //   hint: 'select a day',
              // ),

              BlocBuilder<WeekdaysCubit, IschoolerListState>(
                builder: (context, state) {
                  WeekdaysListModel weekdaysListModel =
                      WeekdaysListModel.empty();
                  if (state.isLoaded() &&
                      state.educonnectAllModel is WeekdaysListModel) {
                    weekdaysListModel =
                        state.educonnectAllModel as WeekdaysListModel;
                  }
                  if (selectedWeekday == null) {
                    selectedWeekday = weekdaysListModel.getTodayItem();
                    // setState(() {});
                    onWeekdaySelected(selectedWeekday);
                  }
                  List<String> options = weekdaysListModel.getItemNames();
                  return EduconnectDropdownWidget(
                    // labelText: ,
                    hint: selectedWeekday?.name ?? 'select a day',
                    onChanged: (value) {
                      setState(() {
                        if (value != null && value != '') {
                          IschoolerModel? selectedData =
                              weekdaysListModel.getModelByName(value);
                          if (selectedData != null) {
                            onWeekdaySelected(selectedData);
                            // widget.onChanged(selectedData);
                          }
                        }
                      });
                    },
                    options: options,
                  );
                },
              ),
              if (selectedWeekday != null && selectedWeekday!.isDayOff) ...{
                Expanded(
                  child: Center(
                    child: Text(selectedWeekday!.name != ''
                        ? '${selectedWeekday!.name} is Day off'
                        : 'No day selected'),
                  ),
                )
              } else ...{
                Expanded(
                  child: DayTableWidget(
                    weeklySessionsListModel: weeklySessionsListModel,
                  ),
                ),
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
      if (selectedWeekday != null) {
        context.read<WeeklySessionsCubit>().getAllItems(
              classId: widget.timeTable.id,
              weekdayId: selectedWeekday!.id,
            );
      }
      setState(() {});
    }
  }
}
