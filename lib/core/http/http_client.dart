import 'dart:io';
import 'package:http/http.dart' as http;

class HttpClientModel {
  static var url = Uri.https(
      'https://bank-statement-bff.herokuapp.com', '/myBalance', {'q': '{http'});
  static String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
  static Future<void> getHttp() async {
    try {
      var response = await http.get(url);
    } catch (e) {}
  }

  static Future<void> getHttpToken() async {
    var respose = await http.get(url, headers: {
      'Token': 'Bearer $token',
    });
  }
}
