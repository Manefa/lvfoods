
import 'package:equatable/equatable.dart';

abstract class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();
}

class StartDeleteProduct extends DeleteProductEvent{
  final String code;

  StartDeleteProduct({required this.code});
  @override
  List<Object?> get props => [code];
}