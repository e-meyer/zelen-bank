import 'package:flutter/material.dart';

class CustonButtonWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> previewContainer;
  final Function()? onTap;
  const CustonButtonWidget(
      {super.key, required this.previewContainer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          shadowColor: Colors.transparent),
      child: Text('Compartilhar', style: Theme.of(context).textTheme.button),
    );
  }
}
