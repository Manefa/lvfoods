import 'package:ivfoods_mobile_app/features/orders/data/models/deliveries_emplacements_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/deliveries_requests_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/favorites_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/my_deliveries_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/notice_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/order_group_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/orders/data/models/recovered_order_model.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/deliveries_emplacements.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/deliveries_requests.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/my_deliveries.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/notice.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/order_group.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/phone.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/recovered_order.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required final String username,
    required final String code,
    required final String fullName,
    required final String email,
    required final String picture,
    required final String password,
    required final String role,
    required final List<PhoneModel> phones,
    required final List<String> restaurants,
    required final List<RecoveredOrderModel> recoveredOrders,
    required final List<OrderGroupModel> ordersGroups,
    required final List<NoticeModel> notices,
    required final List<MyDeliveriesModel> myDeliveries,
    required final List<DeliveriesEmplacementsModel> deliveriesEmplacements,
    required final List<DeliveriesRequestsModel> deliveriesRequests,
    required final FavoritesModel favorites,
    required final String id,
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
    recoveredOrders: List<RecoveredOrderModel>.from(json["recovered_orders"].map((x) => RecoveredOrderModel.fromJson(x))),
    ordersGroups: List<OrderGroupModel>.from(json["orders_groups"].map((x) => OrderGroupModel.fromJson(x))),
    notices: List<NoticeModel>.from(json["notices"].map((x) => NoticeModel.fromJson(x))),
    myDeliveries: List<MyDeliveriesModel>.from(json["my_deliveries"].map((x) => MyDeliveriesModel.fromJson(x))),
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
    "phones": List<Phone>.from(phones!.map((x) => x.toJson())),
    "restaurants": List<String>.from(restaurants!.map((x) => x)),
    "recovered_orders": List<RecoveredOrder>.from(recoveredOrders!.map((x) => x.toJson())),
    "orders_groups": List<OrderGroup>.from(ordersGroups!.map((x) => x.toJson())),
    "notices": List<Notice>.from(notices!.map((x) => x.toJson())),
    "my_deliveries": List<MyDeliveries>.from(myDeliveries!.map((x) => x.toJson())),
    "deliveries_emplacements": List<DeliveriesEmplacements>.from(deliveriesEmplacements!.map((x) => x.toJson())),
    "deliveries_requests": List<DeliveriesRequests>.from(deliveriesRequests!.map((x) => x.toJson())),
    "favorites": favorites!.toJson(),
    "_id": id,
  };
}