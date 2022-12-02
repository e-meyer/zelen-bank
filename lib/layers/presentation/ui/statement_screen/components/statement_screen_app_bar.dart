import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../main.dart';

class StatementAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const StatementAppBarWidget({
    super.key,
    this.title,
    this.trailing,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String? title;
  final Widget? trailing;

  @override
  final Size preferredSize;

  @override
  State<StatementAppBarWidget> createState() => _StatementAppBarWidgetState();
}

class _StatementAppBarWidgetState extends State<StatementAppBarWidget> {
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
      leading: ValueListenableBuilder<bool>(
        valueListenable: isThemeDark,
        builder: (context, value, child) {
          return IconButton(
            icon: Icon(
                isThemeDark.value ? Icons.lightbulb : Icons.lightbulb_outline),
            onPressed: toggleTheme,
          );
        },
      ),
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
