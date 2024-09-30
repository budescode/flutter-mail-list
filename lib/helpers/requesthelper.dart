import 'dart:convert';
import 'dart:io';
import 'package:flutter_project/constants/constants.dart';
import 'package:http/http.dart' as http;


class HttpModel {
  var data;
  int statusCode;
  String? message = '';
  ApiStatusEnum apistatus;

  HttpModel({
    this.message,
    required this.data,
    required this.statusCode,
    required this.apistatus,
  });
}

class RequestHelper {
  static Future<HttpModel> getRequest(
      String url, Map<String, String> apiHeaders) async {
    HttpModel? httpModel;

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeaders);
      int status = response.statusCode;
      var body = response.body;
      var theResponse = jsonDecode(body);
      if (status < 400) {
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.success,
            data: theResponse,
            statusCode: status);
      } else if (status == 401) {
        //logout user or get refresh token
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.failed,
            data: theResponse,
            statusCode: status);
      } else {
        var errordata = theResponse;
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.failed,
            data: errordata,
            statusCode: status);
      }
    } catch (e) {
      if (e.runtimeType == HandshakeException) {
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.failed,
            message: "Connection Timeout",
            data: {            
            },
            statusCode: 400);
      } else if (e.runtimeType == SocketException) {
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.failed,
            message: "No Internet Connection",
            data: {
            },
            statusCode: 400);
      }
       else {
        httpModel = HttpModel(
            apistatus: ApiStatusEnum.failed,
            message: e.toString(),
            data: {
             
            },
            statusCode: 400);
      }
    }
    return httpModel;
  }

 }
