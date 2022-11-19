import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/database/local/hive/string/access.dart';
import '../core/database/network/dio_helper.dart';
import '../core/database/network/end_points.dart';
import '../main.dart';
import '../model/login_model.dart';
import '../view/pages/bank_account.dart';

class LoginController extends GetxController {

  int count = 0;

  increment() {
    count++;
    update();
  }


  decrement() {
    if(count>=0){
      count--;
    }
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
  void select(){
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
     // PreferenceUtils.setString(SharedKeys.apiToken, accessToken);
      //box!.put('bankAccount', BankAccount(currency: accessToken, myMoney: 1000000));
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