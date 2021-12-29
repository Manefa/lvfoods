import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';

class ProductDeleteMasterModel extends ProductDeleteMaster{
  ProductDeleteMasterModel({
    required bool? success,
    required String? msg,
  }) : super(
    success: success,
    msg: msg,
  );


  factory ProductDeleteMasterModel.fromJson(Map<String, dynamic> json) => ProductDeleteMasterModel(
    success: json["success"] == null ? null : json["success"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "msg": msg == null ? null : msg,
  };

  @override
  List<Object?> get props => [success, msg];
}