import 'dart:convert';

import 'package:clash_royale_cards/app/data/dto/icon_urls_dto.dart';
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';

extension RoyaleDto on RoyaleEntity {
  static Map<String, dynamic> toMap(RoyaleEntity royaleEntity) {
    return <String, dynamic>{
      'name': royaleEntity.name,
      'id': royaleEntity.id,
      'maxLevel': royaleEntity.maxLevel,
      'iconUrls': royaleEntity.iconUrls?.toMap(),
    };
  }

  static RoyaleEntity fromMap(Map<String, dynamic> map) {
    return RoyaleEntity(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      maxLevel: map['maxLevel'] != null ? map['maxLevel'] as int : null,
      iconUrls: map['iconUrls'] != null
          ? IconUrlsDto.fromMap(map['iconUrls'] as Map<String, dynamic>)
          : null,
    );
  }

  static String encode(List<RoyaleEntity> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => RoyaleDto.toMap(music))
            .toList(),
      );

  static List<RoyaleEntity> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<RoyaleEntity>((item) => RoyaleDto.fromMap(item))
          .toList();
}
