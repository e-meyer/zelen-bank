import 'package:flutter/material.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class CustomTimelineWidget extends StatelessWidget {
  const CustomTimelineWidget({
    super.key,
    required this.transactionEntity,
  });

  final TransactionEntity transactionEntity;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Container(
        color: isTransactionTypePix() ? kLightGrey : kPlainWhite,
        width: screenSize.width,
        height: 100,
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      Container(
                        color: kTimelineColor,
                        height: 45,
                        width: 1,
                      ),
                      Center(
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: kAquaGreen,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: kTimelineColor,
                        height: 45,
                        width: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transactionEntity.description,
                                style: theme.textTheme.headline1,
                              ),
                              SizedBox(height: 6),
                              Text(
                                transactionEntity.targetName,
                                style: theme.textTheme.subtitle1,
                              ),
                              SizedBox(height: 6),
                              Text(
                                isTransactionSent()
                                    ? '- ${transactionFormattedValue()}'
                                    : transactionFormattedValue(),
                                style: theme.textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        Text(
                          '${transactionEntity.createdAt.day}/${transactionEntity.createdAt.month}',
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            isTransactionTypePix()
                ? Padding(
                    padding: const EdgeInsets.only(top: 12, right: 12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 22,
                        width: 50,
                        color: theme.primaryColor,
                        child: const Center(
                          child: Text(
                            'Pix',
                            style: TextStyle(
                              color: kPlainWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  String transactionFormattedValue() {
    return 'R\$ ${transactionEntity.amount.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  bool isTransactionSent() {
    return transactionEntity.transactionType.contains('OUT');
  }

  bool isTransactionTypePix() {
    return transactionEntity.transactionType.contains('PIX');
  }
}
