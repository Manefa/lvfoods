import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/add_phone/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/repository/add_phone_repository.dart';

class AddPhoneUseCase extends UseCaseAddPhone<AddPhone, Params>{
  final AddPhoneRepository repository;

  AddPhoneUseCase(this.repository);

  @override
  Future<Either<Failure, AddPhone>> call(Params params) async {
    return await repository.addPhone(params.addPhone, params.name);
  }
}

class Params extends Equatable {
  final ForAddPhone addPhone;
  final String name;

  Params({required this.name, required this.addPhone});

  @override
  List<Object> get props => [name];
}