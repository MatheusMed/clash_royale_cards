import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetCardRoyaleUsecases {
  Future<Either<Exception, List<RoyaleEntity>>> call();
}
