import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpService {
  static const String _ipaddress = "https://dog.ceo/api/";

  Future<dynamic> postData({data, apiUrl}) async {
    var fullUrl = Uri.parse(_ipaddress + apiUrl);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _getHeaders());
  }

  Future<dynamic> getData({apiUrl}) async {
    var fullUrl = Uri.parse(_ipaddress + apiUrl);
    return await http.get(fullUrl, headers: _getHeaders());
  }

  _getHeaders() =>
      {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
}