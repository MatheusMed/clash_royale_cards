// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';

enum StatusHome { initial, loading, sucess, failure }

class HomeState {
  final List<RoyaleEntity>? listRoyale;
  final StatusHome statusHome;
  HomeState({
    this.listRoyale,
    this.statusHome = StatusHome.initial,
  });

  HomeState copyWith({
    List<RoyaleEntity>? listRoyale,
    StatusHome? statusHome,
  }) {
    return HomeState(
      listRoyale: listRoyale ?? this.listRoyale,
      statusHome: statusHome ?? this.statusHome,
    );
  }
}
