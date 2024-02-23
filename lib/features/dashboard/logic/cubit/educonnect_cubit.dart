import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/educonnect_model.dart';
import 'ischooler_state.dart';

part 'ischooler_list_state.dart';

abstract class IschoolerListCubit<S extends IschoolerListState>
    extends Cubit<S> {
  IschoolerListCubit(super.initialState);

  Future<void> getAllItems();
  Future<void> getItem({required String id});
  Future<void> addItem({required IschoolerModel model});
  Future<void> updateItem({required IschoolerModel model});
  Future<void> deleteItem({required IschoolerModel model});
}

abstract class IschoolerCubit<SS extends IschoolerState> extends Cubit<SS> {
  IschoolerCubit(super.initialState);

  // Future<void> getAllItems();
  Future<void> getItem({required String id});
  Future<void> addItem({required IschoolerModel model});
  Future<void> updateItem({required IschoolerModel model});
  Future<void> deleteItem({required IschoolerModel model});
}
