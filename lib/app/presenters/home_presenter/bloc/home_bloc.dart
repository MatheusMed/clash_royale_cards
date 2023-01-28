import 'package:bloc/bloc.dart';
import 'package:clash_royale_cards/app/data/dto/royale_dto.dart';
import 'package:clash_royale_cards/app/domain/usecases/implementations/get_card_royale_usecases_imp.dart';
import 'package:clash_royale_cards/app/presenters/home_presenter/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

import '../../../domain/entities/royale_entity.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetCardRoyaleUsecasesImp _cardRoyaleUsecasesImp;
  HomeBloc(this._cardRoyaleUsecasesImp) : super(HomeState());

  getCardsClashRoyale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(statusHome: StatusHome.loading));

    try {
      final response = await _cardRoyaleUsecasesImp();

      bool result = await InternetConnectionChecker().hasConnection;

      if (result) {
        return response.fold(
          (error) => emit(state.copyWith(statusHome: StatusHome.failure)),
          (sucess) async {
            // final translator = GoogleTranslator();
            // for (var element in sucess) {
            //   await translator
            //       .translate(element.name!, from: 'en', to: 'pt')
            //       .then((value) => element.name = value.toString());
            // }
            final encode = RoyaleDto.encode(sucess);
            await prefs.setString('list_cards', encode);
            emit(
              state.copyWith(statusHome: StatusHome.sucess, listRoyale: sucess),
            );
          },
        );
      } else {
        final String? list = prefs.getString('list_cards');
        final List<RoyaleEntity> royaleList = RoyaleDto.decode(list!);
        emit(
          state.copyWith(statusHome: StatusHome.sucess, listRoyale: royaleList),
        );
      }
    } catch (e) {
      emit(state.copyWith(
        statusHome: StatusHome.failure,
      ));
    }
  }

  fetchSaveTranslate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _cardRoyaleUsecasesImp();

    bool result = await InternetConnectionChecker().hasConnection;

    if (result) {
      return response.fold(
        (error) => debugPrint(error.toString()),
        (sucess) async {
          final translator = GoogleTranslator();
          for (var element in sucess) {
            await translator
                .translate(element.name!, from: 'en', to: 'pt')
                .then((value) => element.name = value.toString());
          }
          final encode = RoyaleDto.encode(sucess);
          await prefs.setString('list_cards', encode);
          emit(
            state.copyWith(statusHome: StatusHome.sucess, listRoyale: sucess),
          );
        },
      );
    } else {
      final String? list = prefs.getString('list_cards');
      final List<RoyaleEntity> royaleList = RoyaleDto.decode(list!);
      emit(
        state.copyWith(statusHome: StatusHome.sucess, listRoyale: royaleList),
      );
    }
  }
}
