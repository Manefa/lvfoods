import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/start_recovery/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/repository/start_recovery_repository.dart';

class StartRecoveryUseCase extends UseCaseStartRecovery<StartRecovery, Params>{
  final StartRecoveryRepository repository;
  StartRecoveryUseCase(this.repository);
  @override
  Future<Either<Failure, StartRecovery>> call(Params params) async {
    return await repository.updateStatusOrder(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}