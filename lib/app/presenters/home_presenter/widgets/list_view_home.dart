import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:clash_royale_cards/app/presenters/details_presenter/details_card.dart';
import 'package:flutter/material.dart';

class ListViewHome extends StatelessWidget {
  final List<RoyaleEntity> listaRoyale;

  const ListViewHome(this.listaRoyale, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaRoyale.length,
      itemBuilder: (context, index) {
        final item = listaRoyale[index];
        return ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsCard(item),
              )),
          title: Text(item.name!),
          trailing: Image.network(item.iconUrls!.medium!),
        );
      },
    );
  }
}
