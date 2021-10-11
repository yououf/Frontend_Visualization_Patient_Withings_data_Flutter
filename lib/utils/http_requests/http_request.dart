import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static final String _address = "http://192.168.1.105:";
  static final String _port = "5000/";
  static final String _ftpImgAddress = "http://159.84.130.55:";
  static final String _ftpImgPort = "80/";

  static String _getAddress() {
    return _address + _port;
  }

  static String _getAddressImg() {
    return _ftpImgAddress + _ftpImgPort;
  }

  static Widget getImg(String endpoint, String errorMsg) {
    print(_getAddressImg() + endpoint);
    return Image.network(
      _getAddressImg() + endpoint,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Align(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(errorMsg),
          ),
          alignment: Alignment.center,
        );
      },
    );
  }

  static Future<dynamic> getRequest(String endpoint) async {
    String httpRequest = _getAddress() + endpoint;

    print(httpRequest);

    final response = await http.get(
      httpRequest,
      headers: <String, String>{
        'connection': 'Keep-Alive',
      },
    );

    if (response.statusCode == 200) {
      return (json.decode(response.body.toString()));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed');
    }
  }

  static Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> jsonBody) async {
    String httpRequest = _getAddress() + endpoint;

    print(httpRequest);

    final response = await http.post(httpRequest,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonBody));

    if (response.statusCode != 201) {
      // If the server did not return a 201 OK response,
      // then throw an exception.
      throw Exception('Failed');
    }
  }
}
