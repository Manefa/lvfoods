import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/product.dart';

class Notice extends Equatable{
  final String? user;
  final String? code;
  final String? comment;
  final int? note;
  final Product? product;
  final String? id;

  Notice({
    required final this.user,
    required final this.code,
    required final this.comment,
    required final this.note,
    required final this.product,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "user": user,
    "code": code,
    "comment": comment,
    "note": note,
    "product": product!.toJson(),
    "_id": id,
  };

  @override
  List<Object?> get props => [user, code, comment, note, product, id];
}