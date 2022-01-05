
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';

abstract class MentionOrderReadyRepository {
  Future<Either<Failure, MentionOrderReady>> mentionOrderReady(String code);
}