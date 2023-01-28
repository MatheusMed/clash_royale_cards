import 'package:clash_royale_cards/app/presenters/home_presenter/bloc/home_bloc.dart';
import 'package:clash_royale_cards/app/presenters/home_presenter/bloc/home_state.dart';
import 'package:clash_royale_cards/app/presenters/home_presenter/widgets/list_view_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/implementations/get_card_royale_datasource_imp.dart';
import '../../data/repositories/implementations/get_card_royale_repository_imp.dart';
import '../../domain/usecases/implementations/get_card_royale_usecases_imp.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({Key? key}) : super(key: key);

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  final controller = HomeBloc(GetCardRoyaleUsecasesImp(
      GetCardRoyaleRepositoryImp(GetCardRoyaleDatasourceImp(Dio()))));

  @override
  void initState() {
    controller.getCardsClashRoyale();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.statusHome == StatusHome.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Erro ao fazer a requisicao, tente novamente mais tarde'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cards'),
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.getCardsClashRoyale(),
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: controller,
            builder: (context, state) {
              switch (state.statusHome) {
                case StatusHome.initial:
                  return const SizedBox();
                case StatusHome.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case StatusHome.sucess:
                  return ListViewHome(state.listRoyale!);
                case StatusHome.failure:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Falha ao buscar cartas'),
                        FilledButton(
                            onPressed: () => controller.getCardsClashRoyale(),
                            child: const Text('Tentar Novamente')),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
