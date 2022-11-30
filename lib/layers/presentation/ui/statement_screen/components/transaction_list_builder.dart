import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/timeline_divider_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_card_widget.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/components/transaction_loading_widget.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_alert_dialog.dart';

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
        if (transactionController.currentState == States.loading) {
          final List<TransactionEntity> transactionsList =
              transactionController.transactionList;
          // if its loading and we only return a list with loading widgets,
          // the items that are already in the list will disappear and also
          // the scroll goes all the way to the top

          // so we check if the list is not empty before returning in order
          // to be able to display the items that are already in the list and
          // and animated loading widgets list
          if (transactionsList.isNotEmpty) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  ListView.separated(
                    physics: const ClampingScrollPhysics(),
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
                  ),
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        const TransactionLoadingWidget(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 22),
                    itemCount: 3,
                  ),
                ],
              ),
            );
          }

          // if there isnt any items in the list, just return the loading widgets

          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TransactionLoadingWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 22),
            itemCount: 6,
          );
        } else if (transactionController.currentState == States.success) {
          final List<TransactionEntity> transactionsList =
              transactionController.transactionList;

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
        } else if (transactionController.currentState == States.error) {
          Future.delayed(Duration.zero, () {
            return showAlertDialog(context);
          });
        }
        return Container();
      },
    );
  }
}
