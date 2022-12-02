import 'package:flutter/material.dart';
import 'package:zelenbank/authentication/presentation/ui/login_screen/view/login_screen.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/ui/statement_screen/view/statement_screen.dart';
import 'package:zelenbank/layers/presentation/ui/transaction_details/view/transaction_details_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case kLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case kStatementScreen:
        return MaterialPageRoute(builder: (_) => const StatementScreen());
      case kTransactionDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => TransactionDetails(args.toString()));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kAquaGreen,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
