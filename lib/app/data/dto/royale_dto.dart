import 'package:clash_royale_cards/app/data/dto/icon_urls_dto.dart';
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';

extension RoyaleDto on RoyaleEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'maxLevel': maxLevel,
      'iconUrls': iconUrls?.toMap(),
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
}
