import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/delivered/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/repositories/delivered_repository.dart';

class DeliveredUseCase extends UseCaseDelivered<Delivered, Params>{
  final DeliveredRepository repository;
  DeliveredUseCase(this.repository);
  @override
  Future<Either<Failure, Delivered>> call(Params params) async {
    return await repository.deliveredDelivery(params.code,);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code,});

  @override
  List<Object> get props => [code];
}