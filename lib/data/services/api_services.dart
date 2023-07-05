import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter_developer/config/api_interface.dart';
import 'package:test_flutter_developer/config/app_client.dart';
import 'package:test_flutter_developer/data/models/model_articles.dart';
import 'package:test_flutter_developer/data/models/model_login.dart';

class ApiServices {
  Future<ModelLogin?> login({required String email, required String password}) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/login';
    var token = AppClient.bearerToken;
    EasyLoading.show(status: 'loading...');

    Response result = await dio.post(url, data: {
      'email': email,
      'password': password,
      'token': token,
    });
    EasyLoading.dismiss();
    print(result.data);
    if (result.statusCode == 200 || result.statusCode == 201) {
      var modelAuth = ModelLogin.fromJson(result.data);
      return modelAuth;
    } else {
      return null;
    }
  }

  Future<ModelArticles?> getArticle() async {
    Dio dio = ApiInterface.instance.api;
    String url = 'articles';

    try {
      Response response = await dio.get(url);
      print(response.data);
      if (response.statusCode == 200) {
        var modelAllUser = ModelArticles.fromJson(response.data);

        return modelAllUser;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
