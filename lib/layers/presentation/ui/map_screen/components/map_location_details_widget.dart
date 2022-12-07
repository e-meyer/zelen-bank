import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/map_entity.dart';

class MapLocationDetailsWidget extends StatelessWidget {
  MapEntity map;
  MapLocationDetailsWidget({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Image.network(map.foto,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Text(
            map.nome,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60, left: 24),
          child: Text(
            map.endereco,
          ),
        ),
      ],
    );
  }
}
