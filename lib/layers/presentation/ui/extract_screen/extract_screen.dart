import 'package:flutter/material.dart';
import 'package:zelenbank/layers/presentation/ui/common/app_bar_method.dart';

class ExtractScreen extends StatelessWidget {
  const ExtractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMetod(),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * .135,
          color: Theme.of(context).backgroundColor,
          child: Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ]),
    );
  }
}
