// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../../../domain/entities/transaction_entity.dart';
import '../../../controllers/transaction_controller.dart';

class TransactionType extends StatelessWidget {
  final TransactionEntity data;
  final TransactionController transactionController;
  const TransactionType({
    Key? key,
    required this.data,
    required this.transactionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        transactionController.isReceived(data) ? 'Recebedor' : 'Pagador');
  }
}
