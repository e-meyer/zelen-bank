import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/map_entity.dart';

class MapRepository extends ChangeNotifier {
  final List<MapEntity> _mapLocationList = [
    MapEntity(
      nome: 'Banco Zelen Unidade Central',
      endereco: 'R. Júlio de Castilhos, 301 - Centro, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/QMgdgrJ/1.png',
      latitude: -29.717273,
      longitude: -52.428323,
    ),
    MapEntity(
      nome: 'Banco Zelen Unidade Universitária',
      endereco: 'R. Boa Esperança, 502 - Universitário, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/Pw2NtQH/3.png',
      latitude: -29.6998795,
      longitude: -52.4291161,
    ),
    MapEntity(
      nome: 'Banco Zelen II',
      endereco: 'R. Gramado, 144 - A Grande, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/59hdBQV/2.png',
      latitude: -29.742718,
      longitude: -52.413216,
    ),
  ];

  List<MapEntity> get maps => _mapLocationList;
}
