import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class TransactionDto extends TransactionEntity {
  TransactionDto({
    required super.id,
    required super.createdAt,
    required super.amount,
    required super.transactionType,
    required super.description,
    required super.targetName,
    super.bankName,
  });

  fromJson(json) {
    return TransactionDto(
      id: json['id'] as String,
      createdAt: json['createdAt'] as DateTime,
      amount: json['amount'] as double,
      transactionType: json['tType'] as String,
      description: json['description'] as String,
      targetName: json['from'] ?? json['to'],
      bankName: json['bankName'] as String,
    );
  }
}
