import 'package:cached_network_image/cached_network_image.dart';
import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:clash_royale_cards/app/presenters/details_presenter/details_card.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class ListViewHome extends StatefulWidget {
  final List<RoyaleEntity> listaRoyale;

  const ListViewHome(this.listaRoyale, {super.key});

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listaRoyale.length,
      itemBuilder: (context, index) {
        final item = widget.listaRoyale[index];

        return ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsCard(item),
              )),
          title: Text(item.name!),
          trailing: CachedNetworkImage(
            imageUrl: item.iconUrls!.medium!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
    );
  }
}
