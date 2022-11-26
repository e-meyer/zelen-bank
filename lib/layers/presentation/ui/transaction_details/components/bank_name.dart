import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BankName extends StatelessWidget {
  String? bankName;
  BankName(this.bankName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (bankName != null) {
      return Expanded(
          child: Column(children: [
        const Text("Instituição bancária"),
        Text(bankName!),
      ]));
    } else {
      return Container();
    }
  }
}
