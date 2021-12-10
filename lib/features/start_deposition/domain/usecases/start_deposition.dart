import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/start_deposition/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/repositories/start_deposition_repository.dart';

class StartDepositionUseCase extends UseCaseStartDeposition<StartDeposition, Params>{
  final StartDepositionRepository repository;
  StartDepositionUseCase(this.repository);
  @override
  Future<Either<Failure, StartDeposition>> call(Params params) async {
    return await repository.updateStatusOrder(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}