import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:clash_royale_cards/app/domain/usecases/get_card_royale_usecases.dart';
import 'package:dartz/dartz.dart';

import '../../repositories/get_card_royale_repository.dart';

class GetCardRoyaleUsecasesImp implements IGetCardRoyaleUsecases {
  final IGetCardRoyaleRepository _cardRoyaleRepository;
  GetCardRoyaleUsecasesImp(this._cardRoyaleRepository);
  @override
  Future<Either<Exception, List<RoyaleEntity>>> call() async {
    return await _cardRoyaleRepository();
  }
}
