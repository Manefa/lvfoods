import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/update_password/update_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/repositories/update_password_repository.dart';

class UpdatePasswordUseCase extends UseCaseUpdatePassword<UpdatePasswordMaster, Params>{
  final UpdatePasswordRepository repository;
  UpdatePasswordUseCase(this.repository);
  @override
  Future<Either<Failure, UpdatePasswordMaster>> call(Params params) async {
    return await repository.sendPassword(params.sendPassword);
  }
}

class Params extends Equatable {
  final SendPassword sendPassword;

  Params({required this.sendPassword});

  @override
  List<Object> get props => [sendPassword];
}