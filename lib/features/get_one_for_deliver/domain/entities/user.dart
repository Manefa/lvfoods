import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/deliveries_emplacement.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/deliveries_request.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/favorites.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/notice.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/recovered_order.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/restaurant.dart';

class User extends Equatable{
  final String? username;
  final String? code;
  final String? fullName;
  final String? email;
  final String? picture;
  final String? password;
  final bool? newsletter;
  final String? role;
  final List<Phone>? phones;
  final List<String>? recoveredOrders;
  final List<String>? ordersGroups;
  final List<Notice>? notices;
  final List<String>? myDeliveries;
  final Favorites? favorites;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  User({
    required this.username,
    required this.code,
    required this.fullName,
    required this.email,
    required this.picture,
    required this.password,
    required this.newsletter,
    required this.role,
    required this.phones,
    required this.recoveredOrders,
    required this.ordersGroups,
    required this.notices,
    required this.myDeliveries,
    required this.favorites,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  // factory User.fromJson(Map<String, dynamic> json) => User(
  //   username: json["username"] == null ? null : msgValues.map[json["username"]],
  //   code: json["code"] == null ? null : msgValues.map[json["code"]],
  //   fullName: json["full_name"] == null ? null : msgValues.map[json["full_name"]],
  //   email: json["email"] == null ? null : msgValues.map[json["email"]],
  //   picture: json["picture"] == null ? null : msgValues.map[json["picture"]],
  //   password: json["password"] == null ? null : msgValues.map[json["password"]],
  //   newsletter: json["newsletter"] == null ? null : json["newsletter"],
  //   role: json["role"] == null ? null : json["role"],
  //   phones: json["phones"] == null ? null : List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
  //   restaurants: json["restaurants"] == null ? null : List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  //   recoveredOrders: json["recovered_orders"] == null ? null : List<RecoveredOrder>.from(json["recovered_orders"].map((x) => RecoveredOrder.fromJson(x))),
  //   ordersGroups: json["orders_groups"] == null ? null : List<Msg>.from(json["orders_groups"].map((x) => msgValues.map[x])),
  //   notices: json["notices"] == null ? null : List<Notice>.from(json["notices"].map((x) => Notice.fromJson(x))),
  //   myDeliveries: json["my_deliveries"] == null ? null : List<Msg>.from(json["my_deliveries"].map((x) => msgValues.map[x])),
  //   deliveriesEmplacements: json["deliveries_emplacements"] == null ? null : List<DeliveriesEmplacement>.from(json["deliveries_emplacements"].map((x) => DeliveriesEmplacement.fromJson(x))),
  //   deliveriesRequests: json["deliveries_requests"] == null ? null : List<DeliveriesRequest>.from(json["deliveries_requests"].map((x) => DeliveriesRequest.fromJson(x))),
  //   favorites: json["favorites"] == null ? null : Favorites.fromJson(json["favorites"]),
  //   id: json["_id"] == null ? null : msgValues.map[json["_id"]],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  //   updatedAt: json["updatedAt"] == null ? null : msgValues.map[json["updatedAt"]],
  // );

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

  @override
  List<Object?> get props => [username, code, fullName, email, picture, password, newsletter, role,
  phones, recoveredOrders, ordersGroups, notices, myDeliveries,
  favorites, id, createdAt, updatedAt];
}