import 'package:flutter/material.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/timeline_divider_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_card_widget.dart';

class StatementScreen extends StatefulWidget {
  StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  final TransactionController transactionController =
      serviceLocator.get<TransactionController>();

  final int pageController = 0;

  @override
  void initState() {
    super.initState();
    transactionController.getAllTransactions(pageController);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: appBarMetod(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 20,
              ),
              child: Text(
                'Suas movimentações',
                style: theme.textTheme.headline2,
              ),
            ),
            AnimatedBuilder(
              animation: transactionController,
              builder: (context, child) {
                final List<TransactionEntity> transactionsList =
                    transactionController.transactionList;
                return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: transactionsList.length,
                  itemBuilder: (context, index) {
                    return TransactionCardWidget(
                        transactionEntity: transactionsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return TimelineDividerWidget();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
