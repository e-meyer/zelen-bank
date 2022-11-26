import 'package:flutter/material.dart';
import '../../../../domain/entities/transaction_entity.dart';
import '../../../controllers/transaction_controller.dart';

class TransactionType extends StatelessWidget {
  final TransactionEntity data;
  final TransactionController transactionController;
  TransactionType({
    required this.data,
    required this.transactionController,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
        transactionController.isReceived(data) ? 'Recebedor' : 'Pagador', style: theme.textTheme.headline2);
  }
}
