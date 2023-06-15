import 'dart:convert';
import 'dart:io';

import 'package:app_api/services/api/constant_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> createUser({required Map body}) async {
  try {
    var url = Uri.http(ApiALl().url, ApiALl().createAccount);
    var response = await http.post(url, body: json.encode(body));

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response("error", 111);
  }
}
