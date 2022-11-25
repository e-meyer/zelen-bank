import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExtractScreen extends StatelessWidget {
  const ExtractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: const Text('Extrato'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * .135,
          color: Theme.of(context).backgroundColor,
        ),
      ]),
    );
  }
}
