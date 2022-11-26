import 'package:flutter/material.dart';

class CurrentBalanceSection extends StatefulWidget {
  const CurrentBalanceSection({super.key});

  @override
  State<CurrentBalanceSection> createState() => _CurrentBalanceSectionState();
}

class _CurrentBalanceSectionState extends State<CurrentBalanceSection> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
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
    );
  }
}
