import 'package:clash_royale_cards/app/domain/entities/icon_urls_entity.dart';

extension IconUrlsDto on IconUrlsEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medium': medium,
    };
  }

  static IconUrlsEntity fromMap(Map<String, dynamic> map) {
    return IconUrlsEntity(
      medium: map['medium'] != null ? map['medium'] as String : null,
    );
  }
}
