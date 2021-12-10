import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/deliveries_emplacements.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/deliveries_requests.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/delivery.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/favorites.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/notices.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/phone.dart';

class User extends Equatable{
  final String? username;
  final String? code;
  final String? fullName;
  final String? email;
  final String? picture;
  final String? password;
  final String? role;
  final List<Phone>? phones;
  final List<String>? restaurants;
  final List<String>? recoveredOrders;
  final List<String>? ordersGroups;
  final List<Notice>? notices;
  final List<Delivery>? myDeliveries;
  final List<DeliveriesEmplacements>? deliveriesEmplacements;
  final List<DeliveriesRequests>? deliveriesRequests;
  final Favorites? favorites;
  final String? id;

  User({
    required final this.username,
    required final this.code,
    required final this.fullName,
    required final this.email,
    required final this.picture,
    required final this.password,
    required final this.role,
    required final this.phones,
    required final this.restaurants,
    required final this.recoveredOrders,
    required final this.ordersGroups,
    required final this.notices,
    required final this.myDeliveries,
    required final this.deliveriesEmplacements,
    required final this.deliveriesRequests,
    required final this.favorites,
    required final this.id,
  });

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
    "recovered_orders": List<String>.from(recoveredOrders!.map((x) => x)),
    "orders_groups": List<String>.from(ordersGroups!.map((x) => x)),
    "notices": List<Notice>.from(notices!.map((x) => x.toJson())),
    "my_deliveries": List<Delivery>.from(myDeliveries!.map((x) => x.toJson())),
    "deliveries_emplacements": List<DeliveriesEmplacements>.from(deliveriesEmplacements!.map((x) => x.toJson())),
    "deliveries_requests": List<DeliveriesRequests>.from(deliveriesRequests!.map((x) => x.toJson())),
    "favorites": favorites!.toJson(),
    "_id": id,
  };

  @override
  List<Object?> get props => [username, code, fullName, email, picture, password, role, phones,
  restaurants, recoveredOrders, ordersGroups, notices, myDeliveries, deliveriesEmplacements,
  deliveriesRequests, favorites, id];
}