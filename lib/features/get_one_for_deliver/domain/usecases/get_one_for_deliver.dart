import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/get_one_for_deliver/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/repositories/get_one_for_deliver_repository.dart';

class GetOneForDeliverUseCase extends UseCaseGetOneForDeliver<GetOneForDeliver, Params>{
  final GetOneForDeliverRepository repository;

  GetOneForDeliverUseCase(this.repository);

  @override
  Future<Either<Failure, GetOneForDeliver>> call(Params params) async {
    return await repository.getOneForDeliver(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object?> get props => [code];
}