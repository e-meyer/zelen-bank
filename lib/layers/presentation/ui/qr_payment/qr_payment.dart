import 'dart:convert';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:zelenbank/core/injector/injector.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

import '../../controllers/transaction_controller.dart';

class QrPayment extends StatefulWidget {
  QrPayment({Key? key}) : super(key: key);

  @override
  _QrPaymentState createState() => _QrPaymentState();
}

class _QrPaymentState extends State<QrPayment> {
  final TransactionController _transactionController =
      serviceLocator.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              Map<String, dynamic> rawData = jsonDecode(barcode.rawValue!);
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text('CONFIRM TRANSACTION'),
                        content: Text("value: ${rawData['amount']},"
                            "receiver: ${rawData['receiver']}"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              final transaction =
                                  TransactionEntity.fromJson(rawData);
                              _transactionController
                                  .addTransaction(transaction);
                            },
                            child: const Text('Confirm'),
                          )
                        ],
                      ));
            }
          }),
    );
  }
}
