import '../../../../common/educonnect_model.dart';
import '../../../../common/network/educonnect_response.dart';

abstract class IschoolerListNetwork {
  //model is sent here to get the type of request only
  Future<IschoolerResponse> getAllItems({required IschoolerListModel model});
  Future<bool> addItem({required IschoolerModel model});
  Future<bool> updateItem({required IschoolerModel model});
  Future<bool> deleteItem({required IschoolerModel model});
}
