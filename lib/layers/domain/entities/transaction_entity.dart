class TransactionEntity {
  final String id;
  final DateTime createdAt;
  final double amount;
  final String transactionType;
  final String description;
  final String targetName;
  final String? bankName;

  TransactionEntity({
    required this.id,
    required this.createdAt,
    required this.amount,
    required this.transactionType,
    required this.description,
    required this.targetName,
    this.bankName,
  });
}
