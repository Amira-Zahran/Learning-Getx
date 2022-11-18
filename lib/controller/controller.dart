import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';
import 'database/local/shared_prefrences/preference_utils.dart';
import 'database/local/shared_prefrences/string/access.dart';
import 'database/network/dio_helper.dart';
import 'database/network/end_points.dart';

class LoginController extends GetxController{

  int count = 0;
  void increment() {
    count++;
    update();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? loginModel;

  bool selected = true;
  bool isPassword = true;


  void hidePass (){
    isPassword = !isPassword;
    update();
  }
  void decrement(){
    selected = !selected;
    update();
  }

  Future<void> login () async{
    var json = {
      'email': emailController.text.toString(),
      'password': passwordController.text.toString()
    };

    await DioHelper.postData(url: loginEndPoint, data: json).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      accessToken = loginModel!.data!.accessToken.toString();
      accessToken = value.data['data']['accessToken'];
      PreferenceUtils.setString(SharedKeys.apiToken, accessToken);
      update();
    }).catchError((error){
      print(error);
      if(error is DioError){
        print(error.response!.data['message'],);
        update();
      }
    });
  }


}