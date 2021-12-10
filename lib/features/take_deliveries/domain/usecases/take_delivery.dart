import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/take_deliveries/take_delivery.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/repositories/take_delivery_repository.dart';

class TakeDeliveryUseCase extends UseCaseTakeDelivery<TakeDeliveryMaster, Params>{
  final TakeDeliveryRepository repository;
  TakeDeliveryUseCase(this.repository);
  @override
  Future<Either<Failure, TakeDeliveryMaster>> call(Params params) async {
    return await repository.takeDelivery(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}