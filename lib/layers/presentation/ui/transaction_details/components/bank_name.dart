import 'package:flutter/material.dart';

class BankName extends StatelessWidget {
  String? bankName;
  BankName(this.bankName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (bankName != null) {
      return Expanded(
          child: Column(children: [
        Text("Instituição bancária", style: theme.textTheme.headline2),
        Text(bankName!),
      ]));
    } else {
      return Container();
    }
  }
}
