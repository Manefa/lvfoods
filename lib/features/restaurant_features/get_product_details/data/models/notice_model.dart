
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/models/user_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/notice.dart';

class NoticeModel extends Notice{
  NoticeModel({
    required UserModel? user,
    required String? comment,
    required double? note,
    required String? createdAt,
  }) : super(
    user: user,
    comment: comment,
    note: note,
    createdAt: createdAt
  );

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    comment: json["comment"] == null ? null : json["comment"],
    note: json["note"] == null ? null : json["note"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "user": user == null ? null : user!.toJson(),
    "comment": comment == null ? null : comment,
    "note": note == null ? null : note,
    "createdAt": createdAt == null ? null : createdAt,
  };

  @override
  List<Object?> get props => [user, comment, note, createdAt];
}