import 'package:flutter/material.dart';

import '../../../../../core/share_image/share_image.dart';

class ShareButtonWidget extends StatelessWidget {
  const ShareButtonWidget({super.key, required this.previewContainer});

  final GlobalKey<State<StatefulWidget>> previewContainer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        return shareImage(previewContainer);
      },
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
