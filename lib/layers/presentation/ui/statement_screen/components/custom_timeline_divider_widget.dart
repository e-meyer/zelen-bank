import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors_constants.dart';

class CustomTimelineDividerWidget extends StatelessWidget {
  const CustomTimelineDividerWidget({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
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
