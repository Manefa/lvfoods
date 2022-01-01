import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';

abstract class AddPhoneEvent extends Equatable {
  const AddPhoneEvent();
}

class StartAddPhone extends AddPhoneEvent{
  final ForAddPhone addPhone;
  final String name;

  StartAddPhone({required this.addPhone, required this.name,});
  @override
  List<Object?> get props => [addPhone];
}
