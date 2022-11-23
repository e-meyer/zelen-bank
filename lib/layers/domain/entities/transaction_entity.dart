class TransactionEntity {
  final String id;
  final DateTime createdAt;
  final double amount;
  final String transactionType;
  final String description;
  final String? bankName;
  final String? from;
  final String? to;

  TransactionEntity({
    required this.id,
    required this.createdAt,
    required this.amount,
    required this.transactionType,
    required this.description,
    this.bankName,
    this.from,
    this.to,
  });
}
