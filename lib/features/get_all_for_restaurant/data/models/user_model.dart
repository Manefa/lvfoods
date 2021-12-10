import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/deliveries_emplacements_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/deliveries_requests_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/delivery_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/favorites_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/notices_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required final String? username,
    required final String? code,
    required final String? fullName,
    required final String? email,
    required final String? picture,
    required final String? password,
    required final String? role,
    required final List<PhoneModel>? phones,
    required final List<String>? restaurants,
    required final List<String>? recoveredOrders,
    required final List<String>? ordersGroups,
    required final List<NoticeModel>? notices,
    required final List<DeliveryModel>? myDeliveries,
    required final List<DeliveriesEmplacementsModel>? deliveriesEmplacements,
    required final List<DeliveriesRequestsModel>? deliveriesRequests,
    required final FavoritesModel? favorites,
    required final String? id,
  }) : super(
    username: username,
    code: code,
    fullName: fullName,
    email: email,
    picture: picture,
    password: password,
    role: role,
    phones: phones,
    restaurants: restaurants,
    recoveredOrders: recoveredOrders,
    ordersGroups: ordersGroups,
    notices: notices,
    myDeliveries: myDeliveries,
    deliveriesEmplacements: deliveriesEmplacements,
    deliveriesRequests: deliveriesRequests,
    favorites: favorites,
    id: id,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    code: json["code"],
    fullName: json["full_name"],
    email: json["email"],
    picture: json["picture"],
    password: json["password"],
    role: json["role"],
    phones: List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
    restaurants: List<String>.from(json["restaurants"].map((x) => x)),
    recoveredOrders: List<String>.from(json["recovered_orders"].map((x) => x)),
    ordersGroups: List<String>.from(json["orders_groups"].map((x) => x)),
    notices: List<NoticeModel>.from(json["notices"].map((x) => NoticeModel.fromJson(x))),
    myDeliveries: List<DeliveryModel>.from(json["my_deliveries"].map((x) => DeliveryModel.fromJson(x))),
    deliveriesEmplacements: List<DeliveriesEmplacementsModel>.from(json["deliveries_emplacements"].map((x) => DeliveriesEmplacementsModel.fromJson(x))),
    deliveriesRequests: List<DeliveriesRequestsModel>.from(json["deliveries_requests"].map((x) => DeliveriesRequestsModel.fromJson(x))),
    favorites: FavoritesModel.fromJson(json["favorites"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "code": code,
    "full_name": fullName,
    "email": email,
    "picture": picture,
    "password": password,
    "role": role,
    "phones": List<PhoneModel>.from(phones!.map((x) => x.toJson())),
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "recovered_orders": List<String>.from(recoveredOrders!.map((x) => x)),
    "orders_groups": List<String>.from(ordersGroups!.map((x) => x)),
    "notices": List<NoticeModel>.from(notices!.map((x) => x.toJson())),
    "my_deliveries": List<DeliveryModel>.from(myDeliveries!.map((x) => x.toJson())),
    "deliveries_emplacements": List<DeliveriesEmplacementsModel>.from(deliveriesEmplacements!.map((x) => x.toJson())),
    "deliveries_requests": List<DeliveriesRequestsModel>.from(deliveriesRequests!.map((x) => x.toJson())),
    "favorites": favorites!.toJson(),
    "_id": id,
  };
}