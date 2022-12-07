import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/bank_entity.dart';

class BankRepository extends ChangeNotifier {
  final List<Bank> _banks = [
    Bank(
      nome: 'Banco Zelen Unidade Central',
      endereco: 'R. Mal. Floriano, 895 - Centro, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/QMgdgrJ/1.png',
      latitude: -29.7193881,
      longitude: -49.2624613,
    ),
    Bank(
      nome: 'Banco Zelen Unidade Universitária',
      endereco: 'R. Boa Esperança, 502 - Universitário, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/Pw2NtQH/3.png',
      latitude: -29.6998795,
      longitude: -52.4291161,
    ),
    Bank(
      nome: 'Banco Zelen II',
      endereco: 'R. Gramado, 144 - A Grande, Santa Cruz do Sul - RS',
      foto: 'https://i.ibb.co/59hdBQV/2.png',
      latitude: -29.742718,
      longitude: -52.413216,
    ),
  ];

  List<Bank> get banks => _banks;
}
