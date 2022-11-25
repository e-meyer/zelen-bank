import 'dart:convert';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';
import 'package:zelenbank/layers/data/datasources/dtos/transaction_dto.dart';
import 'package:zelenbank/layers/domain/entities/transaction_entity.dart';

class HttpClientModel {
  HttpClientModel(this.client);
  final client;

  final String apiUrl = kApiUrl;
  final String apiToken = kApiToken;
  final String myBalance = kMyBalance;
  final String myStatement = kMyStatement;
  final String myDtStatement = kMyDtStatement;

  Future<double> getCurrentBalance() async {
    final header = {'Token': apiToken};

    final response = await client.get(
      Uri.parse('$apiUrl/$myBalance'),
      headers: header,
    );

    Map data = jsonDecode(response.body);
    final balanceAmount = data['amount'].toDouble();

    return balanceAmount;
  }

  Future<Map<dynamic, dynamic>> getTransactionsList(int pageNumber) async {
    final header = {'Token': apiToken};

    final response = await client.get(
      Uri.parse('$apiUrl/$myStatement/$kRequestNumber/$pageNumber'),
      headers: header,
    );
    Map data = jsonDecode(response.body);

    return data;
  }

  Future<Map<dynamic, dynamic>> getTransactionById(String id) async {
    final header = {'Token': apiToken};
    final response = await client.get(
      Uri.parse('$apiUrl/$myDtStatement/$id'),
      headers: header,
    );
    Map data = jsonDecode(response.body);
    return data;
  }
}
