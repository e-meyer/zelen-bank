import 'package:flutter/material.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';
import 'package:zelenbank/layers/presentation/ui/common/app_bar_method.dart';

import '../../../../core/utils/constants/colors_constants.dart';

class ExtractScreen extends StatelessWidget {
  const ExtractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: appBarMetod(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                      Text(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 20,
            ),
            child: Text('Suas movimentações'),
          ),
          customTimelineWidget(screenSize),
          customDivider(screenSize),
          customTimelineWidget(screenSize),
        ],
      ),
    );
  }

  Widget customTimelineWidget(screenSize) {
    return Container(
      color: kLightGrey,
      width: screenSize.width,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  color: kTimelineColor,
                  height: 45,
                  width: 1,
                ),
                Center(
                  child: Container(
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
        ],
      ),
    );
  }

  Widget customDivider(screenSize) {
    return SizedBox(
      width: screenSize.width,
      height: 20,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  color: kTimelineColor,
                  height: 10,
                  width: 1,
                ),
                Center(
                  child: Container(
                    height: 0,
                    width: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kTimelineColor,
                  height: 10,
                  width: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
