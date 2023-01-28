import 'package:clash_royale_cards/app/data/datasource/get_card_royale_datasource.dart';
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:clash_royale_cards/app/domain/repositories/get_card_royale_repository.dart';
import 'package:dartz/dartz.dart';

class GetCardRoyaleRepositoryImp implements IGetCardRoyaleRepository {
  final IGetCardRoyaleDatasource _datasource;
  GetCardRoyaleRepositoryImp(this._datasource);
  @override
  Future<Either<Exception, List<RoyaleEntity>>> call() async {
    return await _datasource();
  }
}
