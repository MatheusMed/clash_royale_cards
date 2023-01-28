import 'package:clash_royale_cards/app/core/utils/costants.dart';
import 'package:clash_royale_cards/app/data/datasource/get_card_royale_datasource.dart';
import 'package:clash_royale_cards/app/data/dto/royale_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:dio/dio.dart';

class GetCardRoyaleDatasourceImp implements IGetCardRoyaleDatasource {
  final Dio _dio;

  GetCardRoyaleDatasourceImp(this._dio);

  @override
  Future<Either<Exception, List<RoyaleEntity>>> call() async {
    try {
      final response = await _dio.get(
        'https://api.clashroyale.com/v1/cards',
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      final data = (response.data['items'] as List)
          .map((e) => RoyaleDto.fromMap(e))
          .toList();

      return Right(data);
    } catch (e) {
      return Left(Exception('Erro no datasource'));
    }
  }
}
