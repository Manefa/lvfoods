import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/product.dart';

class Notice extends Equatable{
  final String? user;
  final String? code;
  final String? comment;
  final int? note;
  final Product? product;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  Notice({
    required this.user,
    required this.code,
    required this.comment,
    required this.note,
    required this.product,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory Notice.fromJson(Map<String, dynamic> json) => Notice(
  //   user: json["user"] == null ? null : msgValues.map[json["user"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   comment: json["comment"] == null ? null : msgValues.map[json["comment"]],
  //   note: json["note"] == null ? null : json["note"],
  //   product: json["product"] == null ? null : Product.fromJson(json["product"]),
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [user, code, comment, note, product, id, createdAt, updatedAt];
}