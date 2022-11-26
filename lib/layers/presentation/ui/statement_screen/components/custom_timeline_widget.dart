import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class CustomTimelineWidget extends StatelessWidget {
  const CustomTimelineWidget({
    super.key,
    required this.isFirstWidget,
  });

  final bool isFirstWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            color: kTimelineColor,
            height: isFirstWidget ? 33 : 40,
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
            height: isFirstWidget ? 33 : 40,
            width: 1,
          ),
        ],
      ),
    );
  }
}
