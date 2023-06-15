import 'dart:convert';
import 'package:app_api/services/api/constant_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> loginUser({required Map body}) async {
  try {
    var url = Uri.http(ApiALl().url, ApiALl().loginAccount);
    var response = await http.post(url, body: json.encode(body));

    return response;
  } catch (error) {
    print(error);
    return Response("error", 400);
  }
}
