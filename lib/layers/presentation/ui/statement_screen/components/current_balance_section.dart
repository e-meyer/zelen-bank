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
  final ValueNotifier<bool> balance = ValueNotifier<bool>(true);
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
        child: ValueListenableBuilder(
          valueListenable: balance,
          builder: (context, value, _) => Column(
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
                        balance.value = !balance.value;
                      },
                      icon: Icon(
                          color: theme.primaryColor,
                          size: 20,
                          balance.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _transactionController,
                builder: (context, child) {
                  return Text(balance.value
                      ? _transactionController.balance.toString()
                      : '      ');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
