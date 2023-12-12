import 'dart:convert';

import 'package:ashesi_bus/requests/api_uri.dart';
import 'package:http/http.dart' as http;


/// This is a generic function that sends a POST request to the server.
Future<Map<String, dynamic>> postData(String path, String body) async {
  Map<String, dynamic> result = {};

  try {

    final response = await http.post(
      Uri.http(domain, path),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body,
    );

    Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 201) {

      result = {
        'status': true,
        'message': responseData["message"] ?? 'Success',
      };
    } 
    
    else {
      result = {
        'status': false,
        'message': responseData["message"] ?? 'An error occurred. Please try again.',
      };
    }

  } 
  
  catch (e) {
    result = {
      'status': false,
      'message': 'Request failed. Error: $e',
    };
  }

  return result;
}




