import 'package:flutter/material.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';

class CurrentBalanceSection extends StatefulWidget {
  const CurrentBalanceSection({super.key});

  @override
  State<CurrentBalanceSection> createState() => _CurrentBalanceSectionState();
}

class _CurrentBalanceSectionState extends State<CurrentBalanceSection> {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * .135,
      color: theme.backgroundColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Seu saldo',
                    style: TextStyle(
                      fontSize: 16,
                      color: kPlainBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.visibility_off,
                    color: theme.primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _transactionController,
              builder: (context, child) {
                return Text(_transactionController.balance.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
