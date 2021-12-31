import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/style.dart';

class GetStylesMaster extends Equatable{
  final bool? success;
  final List<Style>? styles;

  GetStylesMaster({
    required this.success,
    required this.styles,
  });


  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "categories": styles == null ? null : List<dynamic>.from(styles!.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [success, styles];
}