import 'package:dartz/dartz.dart';

import '../../domain/entities/royale_entity.dart';

abstract class IGetCardRoyaleDatasource {
  Future<Either<Exception, List<RoyaleEntity>>> call();
}
