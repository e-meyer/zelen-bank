import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final double amount;
  final String transactionType;
  final String description;
  final String targetName;
  final String? bankName;
  final String? authentication;

  const TransactionEntity(
      {required this.id,
      required this.createdAt,
      required this.amount,
      required this.transactionType,
      required this.description,
      required this.targetName,
      this.bankName,
      this.authentication});

  @override
  List<Object?> get props => [
        id,
        createdAt,
        amount,
        transactionType,
        description,
        targetName,
        bankName
      ];

  TransactionEntity.fromJson(Map<String, dynamic> json)
      : id = json['name'],
        createdAt = json['createdAt'],
        amount = json['amount'],
        transactionType = 'PIXCASHOUT',
        description = json['description'],
        targetName = json['receiver'],
        bankName = json['bankname'],
        authentication = json['authentication'];
}
