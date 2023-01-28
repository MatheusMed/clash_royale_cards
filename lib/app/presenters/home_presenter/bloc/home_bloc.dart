import 'package:bloc/bloc.dart';
import 'package:clash_royale_cards/app/domain/usecases/implementations/get_card_royale_usecases_imp.dart';
import 'package:clash_royale_cards/app/presenters/home_presenter/bloc/home_state.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetCardRoyaleUsecasesImp _cardRoyaleUsecasesImp;
  HomeBloc(this._cardRoyaleUsecasesImp) : super(HomeState());

  getCardsClashRoyale() async {
    emit(state.copyWith(statusHome: StatusHome.loading));
    try {
      final response = await _cardRoyaleUsecasesImp();
      return response.fold(
        (error) => emit(state.copyWith(statusHome: StatusHome.failure)),
        (sucess) => emit(
          state.copyWith(statusHome: StatusHome.sucess, listRoyale: sucess),
        ),
      );
    } catch (e) {
      emit(state.copyWith(statusHome: StatusHome.failure));
    }
  }
}
