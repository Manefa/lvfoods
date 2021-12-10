import 'package:equatable/equatable.dart';

class UserMaster extends Equatable{
  final bool? success;

  UserMaster({
    required final this.success,
  });


  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
  };

  @override
  List<Object?> get props => [success];
}