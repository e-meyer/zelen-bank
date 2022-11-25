import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/custom_timeline_divider_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/custom_timeline_widget.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: appBarMetod(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * .135,
            color: theme.backgroundColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenSize.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Seu saldo',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.visibility_off,
                        color: theme.primaryColor,
                        size: 26,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 20,
            ),
            child: Text('Suas movimentações'),
          ),
          CustomTimelineWidget(
            transactionEntity: TransactionEntity(
              id: 'ABC',
              amount: 1000,
              createdAt: DateTime.now(),
              transactionType: 'IN',
              description: 'ALALA',
              targetName: 'ALALALALA',
            ),
          ),
          CustomTimelineDividerWidget(),
          CustomTimelineWidget(
            transactionEntity: TransactionEntity(
              id: 'ABC',
              amount: 1000,
              createdAt: DateTime.now(),
              transactionType: 'PIXCASHIN',
              description: 'Transferência PIX recebida',
              targetName: 'ALALALALA',
            ),
          ),
        ],
      ),
    );
  }
}
