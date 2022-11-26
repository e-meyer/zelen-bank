import 'package:flutter/material.dart';

import '../../../../../core/share_image/share_image.dart';

ElevatedButton customElevatedButtom(
    BuildContext context, GlobalKey<State<StatefulWidget>> previewContainer) {
  return ElevatedButton(
    onPressed: () {
      return shareImage(previewContainer);
    },
    style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        shadowColor: Colors.transparent),
    child: const Text('Compartilhar'),
  );
}
