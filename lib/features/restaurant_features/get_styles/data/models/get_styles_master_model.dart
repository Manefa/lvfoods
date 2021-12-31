
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/data/models/style_model.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';

class GetStylesMasterModel extends GetStylesMaster{

  GetStylesMasterModel({
    required bool? success,
    required List<StyleModel>? styles,
  }) : super(
    success: success,
    styles: styles,
  );

  factory GetStylesMasterModel.fromJson(Map<String, dynamic> json) => GetStylesMasterModel(
    success: json["success"] == null ? null : json["success"],
    styles: json["styles"] == null ? null : List<StyleModel>.from(json["styles"].map((x) => StyleModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "categories": styles == null ? null : List<dynamic>.from(styles!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, styles];
}