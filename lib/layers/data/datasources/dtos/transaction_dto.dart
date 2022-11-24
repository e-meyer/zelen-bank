// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class TransactionDto extends TransactionEntity {
  String id;
  DateTime createdAt;
  double amount;
  String transactionType;
  String description;
  String targetName;
  String? bankName;

  TransactionDto({
    required this.id,
    required this.createdAt,
    required this.amount,
    required this.transactionType,
    required this.description,
    required this.targetName,
    this.bankName,
  }) : super(
          id: id,
          createdAt: createdAt,
          amount: amount,
          transactionType: transactionType,
          description: description,
          targetName: targetName,
          bankName: bankName,
        );

  factory TransactionDto.fromMap(Map<String, dynamic> map) {
    return TransactionDto(
      id: map['id'] as String,
      createdAt: map['createdAt'] as DateTime,
      amount: map['amount'] as double,
      transactionType: map['transactionType'] as String,
      description: map['description'] as String,
      targetName: map['from'] ?? map['to'],
      bankName: map['bankName'] != null ? map['bankName'] as String : null,
    );
  }

  factory TransactionDto.fromJson(String source) =>
      TransactionDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
