import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/product_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/notice.dart';

class NoticeModel extends Notice{

  NoticeModel({
    required final String? user,
    required final String? code,
    required final String? comment,
    required final int? note,
    required final ProductModel? product,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    user: user,
    code: code,
    comment: comment,
    note: note,
    product: product,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
    user: json["user"] == null ? null : json["user"],
    code: json["code"] == null ? null : json["code"],
    comment: json["comment"] == null ? null : json["comment"],
    note: json["note"] == null ? null : json["note"],
    product: json["product"] == null ? null : ProductModel.fromJson(json["product"]),
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user,
    "code": code == null ? null : code,
    "comment": comment == null ? null : comment,
    "note": note == null ? null : note,
    "product": product == null ? null : product!.toJson(),
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}