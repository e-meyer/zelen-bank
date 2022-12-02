import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zelenbank/core/utils/constants/colors_constants.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    this.leading,
    this.title,
    this.trailing,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final Widget? leading;
  final Widget? trailing;

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
        style: const TextStyle(
          color: kPlainBlack,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      actions: [
        trailing != null ? trailing! : Container(),
      ],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}
