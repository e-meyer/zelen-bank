import 'package:flutter/material.dart';
import 'package:zelenbank/core/firebase/auth/auth_service.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/core/utils/constants/route_constants.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:zelenbank/layers/presentation/ui/common/custom_app_bar_widget.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      transactionController.getTransactionsList(pageController);
      _scrollController.addListener(() {
        if (_scrollController.position.atEdge) {
          bool isBottom = _scrollController.position.pixels != 0;
          if (isBottom) {
            pageController++;
            transactionController.getTransactionsList(pageController);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBarWidget(
        title: 'Extrato',
        trailing: InkWell(
          onTap: () {
            AuthService().signOut();
            Navigator.pushNamed(context, kLoginScreen);
          },
          child: Icon(Icons.logout),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await transactionController.getTransactionsList(pageController);
        },
        color: kAquaGreen,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
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
              TransactionListBuilder(
                pageController: pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
