import '../../../../common/educonnect_model.dart';
import '../../../../common/network/educonnect_response.dart';

abstract class IschoolerNetwork {
  //model is sent here to get the type of request only
  Future<IschoolerResponse> getItem({required String id});
  Future<bool> addItem({required IschoolerModel model});
  Future<bool> updateItem({required IschoolerModel model});
  Future<bool> deleteItem({required IschoolerModel model});
}
