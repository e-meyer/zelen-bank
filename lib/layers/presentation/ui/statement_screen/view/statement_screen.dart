import 'package:flutter/material.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/app_bar_method.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/current_balance_section.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_list_builder.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  final TransactionController transactionController =
      serviceLocator.get<TransactionController>();

  final ScrollController _scrollController = ScrollController();

  int pageController = 0;

  @override
  void initState() {
    super.initState();
    transactionController.getTransactionsList(pageController);
    transactionController.fetchBalance();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels != 0;
        if (isBottom) {
          pageController++;
          transactionController.getTransactionsList(pageController);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: appBarMethod(titulo: 'Extrato'),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const PageScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CurrentBalanceSection(),
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
            const TransactionListBuilder(),
          ],
        ),
      ),
    );
  }
}
