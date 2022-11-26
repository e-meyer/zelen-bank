import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class LoadingSkeleton extends StatefulWidget {
  const LoadingSkeleton({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  final double? height, width;
  final double radius;

  @override
  State<LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<LoadingSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 800),
        baseColor: kDarkGrey,
        highlightColor: kLightGrey,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: kLightGrey.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
