import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/deposited/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/repositories/deposited_repository.dart';

class DepositedUseCase extends UseCaseDeposited<Deposited, Params>{
  final DepositedRepository repository;
  DepositedUseCase(this.repository);
  @override
  Future<Either<Failure, Deposited>> call(Params params) async {
    return await repository.updateStatusOrder(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}