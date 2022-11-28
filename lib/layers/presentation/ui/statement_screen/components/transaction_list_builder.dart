import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/timeline_divider_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_card_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_loading_widget.dart';

import '../../../../../core/injector/injector.dart';
import '../../../../domain/entities/transaction_entity.dart';
import '../../../controllers/transaction_controller.dart';

class TransactionListBuilder extends StatefulWidget {
  const TransactionListBuilder({super.key});

  @override
  State<TransactionListBuilder> createState() => _TransactionListBuilderState();
}

class _TransactionListBuilderState extends State<TransactionListBuilder> {
  final TransactionController transactionController =
      serviceLocator.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transactionController,
      builder: (context, child) {
        final List<TransactionEntity> transactionsList =
            transactionController.transactionList;
        if (transactionsList.isNotEmpty) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactionsList.length,
            itemBuilder: (context, index) {
              bool isFirstTransaction = index == 0;
              return TransactionCardWidget(
                transactionEntity: transactionsList[index],
                isFirstWidget: isFirstTransaction,
              );
            },
            separatorBuilder: (context, index) {
              return const TimelineDividerWidget();
            },
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => const TransactionLoadingWidget(),
          separatorBuilder: (context, index) => const SizedBox(height: 22),
          itemCount: 6,
        );
      },
    );
  }
}
