import 'package:ivfoods_mobile_app/features/orders/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/notice.dart';

class NoticeModel extends Notice{
  NoticeModel({
    required final String? user,
    required final String? code,
    required final String? comment,
    required final int? note,
    required final ProductModel? product,
    required final String? id,
  }) : super(
    user: user,
    code: code,
    comment: comment,
    note: note,
    product: product,
    id: id,
  );

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
    user: json["user"],
    code: json["code"],
    comment: json["comment"],
    note: json["note"],
    product: ProductModel.fromJson(json["product"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "comment": comment,
    "note": note,
    "product": product!.toJson(),
    "_id": id,
  };
}