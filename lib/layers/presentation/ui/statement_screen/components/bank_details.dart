import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/bank_entity.dart';

class BankDetails extends StatelessWidget {
  Bank bank;
  BankDetails({Key? key, required this.bank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Image.network(bank.foto,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Text(
              bank.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              bank.endereco,
            ),
          ),
        ],
      ),
    );
  }
}
