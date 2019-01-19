import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

enum RequestStatu { loading, success, fail }

class ShareHttp {
  static Dio _client;
 CancelToken _cancelToken;
  factory ShareHttp() => _getInstance();
  static ShareHttp get instance => _getInstance();
  static ShareHttp _instance;

  ShareHttp._internal(){
    _client = new Dio();
    _client.options.baseUrl = 'https://api.inongjia.net/api/';
    _client.options.connectTimeout = 5000;
    _client.options.receiveTimeout = 5000;
    _client.options.headers = {'uid': 38};
    _cancelToken = CancelToken();
  }

  static ShareHttp _getInstance() {
    if (_instance == null) {
      _instance = new ShareHttp._internal();
    }
    return _instance;
  }

  requestcancle(){
    _cancelToken.cancel('取消请求');
  }

  get(String subPath, Map<String, dynamic> params, Function success,
      Function fail) {
    _request('GET', subPath, params, success, fail);
  }

  post(String subPath, Map<String, dynamic> params, Function success,
      Function fail) {
    _request('POST', subPath, params, success, fail);
  }

  //真正发起网络请求的地方
  _request(String method, String subPath, Map<String, dynamic> params,
      Function success, Function fail) async {
    /* 拦截器
    _client.interceptor.request.onSend = (Options options){
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    };
    _client.interceptor.response.onSuccess = (Response response) {
      // 在返回响应数据之前做一些预处理
      return response; // continue
    };

    _client.interceptor.response.onError = (DioError e){
      // 当请求失败时做一些预处理
      return e;//continue
    };
    */

    try {
      Response response;
      if (method == 'POST') {
        response = await _client.post(subPath, data: params, cancelToken: _cancelToken);
      } else {
        response = await _client.get(subPath, data: params, cancelToken: _cancelToken);
      }

      if (response.statusCode == 200) {
        print(response.data.toString());
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusCode);
        }
      }
    } catch (e) {
      if (fail != null) {
        fail(e);
      }
      _netErrorTost();
    }
  }

  _netErrorTost() {
    Fluttertoast.showToast(
        msg: "网络异常",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }
}
