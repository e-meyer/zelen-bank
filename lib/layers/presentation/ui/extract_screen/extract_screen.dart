import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zelenbank/layers/presentation/ui/common/app_bar_method.dart';

class ExtractScreen extends StatelessWidget {
  const ExtractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBarMetod(),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * .135,
          width: MediaQuery.of(context).size.width * 1,
          color: Theme.of(context).backgroundColor,
        ),
      ]),
    );
  }
}
