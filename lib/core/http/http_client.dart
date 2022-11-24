import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class HttpClientModel {
  final String apiUrl = kApiUrl;
  final String apiToken = kApiToken;
  final String myBalance = kMyBalance;
  final String myStatement = kMyStatement;
  final String myDtStatement = kMyDtStatement;

  Future<double> getCurrentBalance() async {
    final header = {'Token': apiToken};

    final response = await http.get(
      Uri.parse('$apiUrl/$myBalance'),
      headers: header,
    );
    Map data = jsonDecode(response.body);
    final balanceAmount = data['amount'].toDouble();

    return balanceAmount;
  }

  Future<List<TransactionEntity>> getTransactionsList(int pageNumber) async {
    final header = {'Token': apiToken};

    final response = await http.get(
      Uri.parse('$apiUrl/$myStatement/$kRequestNumber/$pageNumber'),
      headers: header,
    );
    Map data = jsonDecode(response.body);
    List<TransactionEntity> list = [];
    for (var transaction in data['items']) {
      list.add(
        TransactionEntity(
          id: transaction['id'] as String,
          createdAt: transaction['createdAt'] as DateTime,
          amount: transaction['amount'] as double,
          transactionType: transaction['tType'] as String,
          description: transaction['description'] as String,
          targetName: transaction['from'] ?? transaction['to'],
        ),
      );
    }
    return list;
  }

  Future<TransactionEntity> getTransactionById(String id) async {
    final header = {'Token': apiToken};
    final response = await http.get(
      Uri.parse('$apiUrl/$myDtStatement/$id'),
      headers: header,
    );
    Map data = jsonDecode(response.body);
    TransactionEntity transactionEntity = TransactionEntity(
      id: data['id'] as String,
      createdAt: data['createdAt'] as DateTime,
      amount: data['amount'] as double,
      transactionType: data['tType'] as String,
      description: data['description'] as String,
      targetName: data['from'] ?? data['to'],
    );
    return transactionEntity;
  }
}
