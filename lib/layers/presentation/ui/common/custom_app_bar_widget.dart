import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.leading,
    this.title,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final Widget? leading;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      leading: leading,
      title: Text(
        title ?? '',
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
