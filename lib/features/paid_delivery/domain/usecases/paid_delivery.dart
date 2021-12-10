import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/paid_delivery/paid_delivery.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/repositories/paid_delivery_repository.dart';

class PaidDeliveryUseCase extends UseCasePaidDelivery<PaidDeliveryMaster, Params>{
  final PaidDeliveryRepository repository;
  PaidDeliveryUseCase(this.repository);

  @override
  Future<Either<Failure, PaidDeliveryMaster>> call(Params params) async {
    return await repository.paidDelivery(params.code);
  }
}

class Params extends Equatable{
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}