import 'package:equatable/equatable.dart';

class Styles extends Equatable{

  final String? name;
  final String? code;
  final String? description;

  Styles({
    required final this.name,
    required final this.code,
    required final this.description,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "description": description,
  };

  @override
  List<Object?> get props => [name, code, description, ];
}