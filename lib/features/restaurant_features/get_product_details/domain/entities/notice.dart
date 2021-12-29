import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/user.dart';

class Notice extends Equatable{
  final User? user;
  final String? comment;
  final double? note;
  final String? createdAt;

  Notice({
    required this.user,
    required this.comment,
    required this.note,
    required this.createdAt,
  });

  // factory Notice.fromJson(Map<String, dynamic> json) => Notice(
  //   user: json["user"] == null ? null : User.fromJson(json["user"]),
  //   comment: json["comment"] == null ? null : msgValues.map[json["comment"]],
  //   note: json["note"] == null ? null : json["note"],
  //   createdAt: json["createdAt"] == null ? null : msgValues.map[json["createdAt"]],
  // );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user!.toJson(),
    "comment": comment == null ? null : comment,
    "note": note == null ? null : note,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [user, comment, note, createdAt];
}