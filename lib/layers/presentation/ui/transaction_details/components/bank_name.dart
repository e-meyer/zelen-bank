import 'package:flutter/material.dart';

class BankName extends StatelessWidget {
  String? bankName;
  BankName(this.bankName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bankName != null) {
      return Expanded(
          child: Column(children: [
        const Text(
          "Instituição bancária",
          style: TextStyle(
            height: 3.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(bankName!),
      ]));
    } else {
      return Container();
    }
  }
}
