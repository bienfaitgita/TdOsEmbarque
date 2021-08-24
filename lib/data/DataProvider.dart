import 'dart:convert';

import 'package:exo/models/client.dart';
import 'package:exo/models/result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DataApiProvider {
  final myBaseUrl = "http://192.168.43.246:8000/api/student";
  final http.Client httpClient = http.Client();

  Future<Result> saveClient({@required Client client}) async {
    try {
      print(jsonEncode(client));
      String url = Uri.encodeFull('$myBaseUrl/save');
      final response = await httpClient.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode(client),
      );
      print(response.body);
      if (response.statusCode != 200) {
        throw Exception('une erreur est servenue, reessayer!');
      }
      final json = (jsonDecode(response.body));
      return Result.fromJson(json);
    } catch (e) {
      Result res = new Result(status: false);
      print('Error occured : $e');
      return res;
    }
  }

  Future<Client> getClientlogin({String username, String password}) async {
    try {
      String url = Uri.encodeFull('$myBaseUrl/login');
      final response = await httpClient.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode != 200) {
        Fluttertoast.showToast(msg: 'Error occured when getting user data');
        // throw Exception('error getting user data');
        return null;
      }
      print(response.body);

      final json = jsonDecode(response.body);
      print("*************");
      print(json['message']);
      if (json['status']) {
        return Client.fromJson(json['message']);
      } else {
        Fluttertoast.showToast(msg: json['message']);
        return null;
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Error occured. Try Later');
      return null;
    }
  }
}
