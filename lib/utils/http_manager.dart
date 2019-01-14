import 'dart:io';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

const String kBaseUrl = 'https://api.inongjia.net/api/';

enum RequestStatu{
  loading,
  success,
  fail
}

class HttpShareManager {
  static final HttpShareManager _singleton = new HttpShareManager._internal();
  static HttpClient _client;

  factory HttpShareManager() {
    _client = new HttpClient();
    return _singleton;
  }

  HttpShareManager._internal();

   get(String subPath, Map<String, dynamic> params, success, fail) async {
    try {
      var request = await _client.getUrl(Uri.parse('$kBaseUrl$subPath'));
      request.add(params);
      _addHeaders(request);
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Map modelMap = jsonDecode(json);
        if(success != null){
          success(modelMap);
        }
      } else {
        if(fail != null){
          fail();
        }
      }
    } catch (exception) {
      if(fail != null){
        fail(exception);
        Fluttertoast.showToast(
            msg: "网络异常",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black38,
            textColor: Colors.white
        );
      }
    }
  }

   post(String subPath, Map<String, dynamic> params, Function success, Function fail) async {
    try {
      var request = await _client.postUrl(Uri.parse(subPath));
      _addHeaders(request);
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Map modelMap = jsonDecode(json);
        if(success != null){
          success(modelMap);
        }
      } else {
        if(fail != null){
          fail();
        }
      }
    } catch (exception) {
      if(fail != null){
        fail();
      }
      Fluttertoast.showToast(
          msg: "网络异常",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black38,
          textColor: Colors.white
      );
    }
  }
}


_addHeaders(HttpClientRequest request){
  request.headers.add('uid', '38');
  print(request);
}
