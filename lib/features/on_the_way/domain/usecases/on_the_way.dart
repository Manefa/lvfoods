
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/on_the_way/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/repositories/on_the_way_repository.dart';

class OnTheWayUseCase extends UseCaseOnTheWay<OnTheWay, Params>{
  final OnTheWayRepository repository;
  OnTheWayUseCase(this.repository);
  @override
  Future<Either<Failure, OnTheWay>> call(Params params) async {
    return await repository.inProgressDelivery(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}