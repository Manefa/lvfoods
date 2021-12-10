import 'package:equatable/equatable.dart';

class Phone extends Equatable{
  final String? code;
  final String? content;

  Phone({
    required final this.code,
    required final this.content,
  });

  Map<String, dynamic> toJson() => {
    "code": code,
    "content": content,
  };

  @override
  List<Object?> get props => [code, content];
}