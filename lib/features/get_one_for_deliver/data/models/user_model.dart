import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/deliveries_emplacement_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/deliveries_request.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/favorites_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/notice_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required final String? username,
    required final String? code,
    required final String? fullName,
    required final String? email,
    required final String? picture,
    required final String? password,
    required final bool? newsletter,
    required final String? role,
    required final List<PhoneModel>? phones,
    required final List<String>? recoveredOrders,
    required final List<String>? ordersGroups,
    required final List<NoticeModel>? notices,
    required final List<String>? myDeliveries,
    required final FavoritesModel? favorites,
    required final String? id,
    required final String? createdAt,
    required final String? updatedAt,
  }) : super(
    username: username,
    code: code,
    fullName: fullName,
    email: email,
    picture: picture,
    password: password,
    newsletter: newsletter,
    role: role,
    phones: phones,
    recoveredOrders: recoveredOrders,
    ordersGroups: ordersGroups,
    notices: notices,
    myDeliveries: myDeliveries,
    favorites: favorites,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"] == null ? null : json["username"],
    code: json["code"] == null ? null : json["code"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    email: json["email"] == null ? null : json["email"],
    picture: json["picture"] == null ? null : json["picture"],
    password: json["password"] == null ? null : json["password"],
    newsletter: json["newsletter"] == null ? null : json["newsletter"],
    role: json["role"] == null ? null : json["role"],
    phones: json["phones"] == null ? null : List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
    recoveredOrders: json["recovered_orders"] == null ? null : List<String>.from(json["recovered_orders"].map((x) => x)),
    ordersGroups: json["orders_groups"] == null ? null : List<String>.from(json["orders_groups"].map((x) => x)),
    notices: json["notices"] == null ? null : List<NoticeModel>.from(json["notices"].map((x) => NoticeModel.fromJson(x))),
    myDeliveries: json["my_deliveries"] == null ? null : List<String>.from(json["my_deliveries"].map((x) => x)),
    favorites: json["favorites"] == null ? null : FavoritesModel.fromJson(json["favorites"]),
    id: json["_id"] == null ? null : json["_id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "code": code == null ? null : code,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "picture": picture == null ? null : picture,
    "password": password == null ? null : password,
    "newsletter": newsletter == null ? null : newsletter,
    "role": role == null ? null : role,
    "phones": phones == null ? null : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "recovered_orders": recoveredOrders == null ? null : List<dynamic>.from(recoveredOrders!.map((x) => x)),
    "orders_groups": ordersGroups == null ? null : List<dynamic>.from(ordersGroups!.map((x) => x)),
    "notices": notices == null ? null : List<dynamic>.from(notices!.map((x) => x.toJson())),
    "my_deliveries": myDeliveries == null ? null : List<dynamic>.from(myDeliveries!.map((x) => x)),
    "favorites": favorites == null ? null : favorites!.toJson(),
    "_id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
  };
}