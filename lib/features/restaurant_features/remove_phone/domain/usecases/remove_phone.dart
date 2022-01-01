
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/remove_phone/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/repository/remove_phone_repository.dart';

class RemovePhoneUseCase extends UseCaseRemovePhone<RemovePhone, Params>{
  final RemovePhoneRepository repository;

  RemovePhoneUseCase(this.repository);

  @override
  Future<Either<Failure, RemovePhone>> call(Params params) async {
    return await repository.removePhone(params.phone, params.name);
  }
}

class Params extends Equatable {
  final String phone;
  final String name;

  Params({required this.name, required this.phone});

  @override
  List<Object> get props => [name];
}