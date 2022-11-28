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
  final TransactionController balanceController =
      serviceLocator.get<TransactionController>();

  @override
  void initState() {
    balanceController.getBalanceVisibility();
    super.initState();
    balanceController.getCurrentBalance();
  }

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
            SizedBox(
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
                  IconButton(
                    onPressed: () {
                      balanceController.changeBalanceVisibility();
                    },
                    icon: AnimatedBuilder(
                      animation: balanceController,
                      builder: (context, child) {
                        return Icon(
                          balanceController.isBalanceVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: theme.primaryColor,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: balanceController,
              builder: (context, child) {
                return balanceController.isBalanceVisible
                    ? SizedBox(
                        height: 40,
                        child: RichText(
                          text: TextSpan(
                            text: 'R\$ ',
                            style: theme.textTheme.caption,
                            children: [
                              TextSpan(
                                text: transactionFormattedValue(),
                                style: theme.textTheme.headline4,
                              )
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 40,
                        width: screenSize.width * 0.31,
                        child: Center(
                          child: Container(
                            height: 2,
                            color: theme.primaryColor,
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  String transactionFormattedValue() {
    return balanceController.balance.toStringAsFixed(2).replaceAll('.', ',');
  }
}
