import 'dart:convert';
import 'package:zelenbank/core/utils/constants/api_endpoints_constants.dart';

class HttpClientModel {
  HttpClientModel(this.client);

  // ignore: prefer_typing_uninitialized_variables
  final client;

  final String apiUrl = kApiUrl;
  final String apiToken = kApiToken;
  final String myBalance = kMyBalance;
  final String myStatement = kMyStatement;
  final String myDtStatement = kMyDtStatement;

  Future<Map<dynamic, dynamic>> getCurrentBalance() async {
    final header = {'Token': apiToken};

    final response = await client.get(
      Uri.parse('$apiUrl/$myBalance'),
      headers: header,
    );
    Map data = jsonDecode(response.body);
    return data;
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
