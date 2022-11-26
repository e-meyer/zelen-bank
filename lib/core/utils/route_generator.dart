import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/view/statement_screen.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/view/transaction_details_screen.dart';

class RouteGenerator {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case kStatementScreen:
        return MaterialPageRoute(builder: (_) => const StatementScreen());
      case kTransactionDetailsScreen:
        return MaterialPageRoute(
            builder: (_) =>
                TransactionDetails(routeSettings.arguments.toString()));
      default:
        return null;
    }
  }
}
