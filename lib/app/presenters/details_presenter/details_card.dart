import 'package:clash_royale_cards/app/domain/entities/royale_entity.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final RoyaleEntity royaleEntity;

  const DetailsCard(this.royaleEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(royaleEntity.name!),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Image.network(royaleEntity.iconUrls!.medium!),
          ),
        ],
      ),
    );
  }
}
