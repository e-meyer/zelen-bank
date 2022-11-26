import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class Authentication extends StatelessWidget {
  TransactionEntity data;
  Authentication(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return data.authentication != null
        ? Expanded(
            child: Column(children: [
            Text('Autenticação', style: theme.textTheme.headline2)
          ]))
        : Container();
  }
}
