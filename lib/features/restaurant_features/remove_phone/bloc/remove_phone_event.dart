import 'package:equatable/equatable.dart';

abstract class RemovePhoneEvent extends Equatable {
  const RemovePhoneEvent();
}

class StartRemovePhone extends RemovePhoneEvent{
  final String phone;
  final String name;

  StartRemovePhone({required this.phone, required this.name,});
  @override
  List<Object?> get props => [phone, name];
}
