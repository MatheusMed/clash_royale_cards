import 'package:dartz/dartz.dart';

import '../entities/royale_entity.dart';

abstract class IGetCardRoyaleRepository {
  Future<Either<Exception, List<RoyaleEntity>>> call();
}
