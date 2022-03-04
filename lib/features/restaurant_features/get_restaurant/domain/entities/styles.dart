import 'package:equatable/equatable.dart';

class Styles extends Equatable{

  final String? name;
  final String? code;
  final String? description;
  final String? id;

  Styles({
    required final this.name,
    required final this.code,
    required final this.description,
    required final this.id,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
    "_id": id,
  };

  @override
  List<Object?> get props => [name, code, description, id];
}