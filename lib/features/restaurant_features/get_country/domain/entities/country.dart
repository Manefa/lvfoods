import 'package:equatable/equatable.dart';

class Country extends Equatable{
  final String? name;
  final String? code;
  final bool? status;
  final String? id;

  Country({
    required this.name,
    required this.code,
    required this.status,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "status": status == null ? null : status,
    "_id": id == null ? null : id,
  };

  @override
  List<Object?> get props => [name, code, status, id];
}
