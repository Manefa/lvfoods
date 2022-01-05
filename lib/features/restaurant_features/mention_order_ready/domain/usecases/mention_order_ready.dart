import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/mention_order_ready/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/repository/mention_order_ready_repository.dart';

class MentionOrderReadyUseCase extends UseCaseMentionOrderReady<MentionOrderReady, Params>{
  final MentionOrderReadyRepository repository;
  MentionOrderReadyUseCase(this.repository);
  @override
  Future<Either<Failure, MentionOrderReady>> call(Params params) async {
    return await repository.mentionOrderReady(params.code);
  }
}

class Params extends Equatable{
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}