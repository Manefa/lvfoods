
import 'package:equatable/equatable.dart';

abstract class GetProductDetailsEvent extends Equatable {
  const GetProductDetailsEvent();
}

class StartGetProductDetails extends GetProductDetailsEvent{
  final String code;

  StartGetProductDetails({required this.code});
  @override
  List<Object?> get props => [code];
}