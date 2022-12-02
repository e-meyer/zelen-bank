import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../main.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
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
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  ValueNotifier<bool> isThemeDark = ValueNotifier<bool>(false);

  toggleTheme() {
    isThemeDark.value = !isThemeDark.value;
    // aqui ficara funcao para trocar tema
    tema.value = isThemeDark.value ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      leading: widget.leading,
      title: Text(
        widget.title ?? '',
      ),
      centerTitle: true,
      actions: [
        widget.trailing != null ? widget.trailing! : Container(),
      ],
      elevation: 0.0,
    );
  }
}
