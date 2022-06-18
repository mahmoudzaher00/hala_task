import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hala_task/app/shard_pref.dart';
import 'package:hala_task/screens/auth/sing_in/sign_in_imports.dart';
import 'package:hala_task/screens/home/home_imports.dart';
import 'package:provider/provider.dart';
import '../app/functions.dart';

class SignInProvider extends ChangeNotifier {
  static SignInProvider get(context) => Provider.of<SignInProvider>(context,);
  SignInData signInData = SignInData();
  bool _password = true;
  bool loading=false;
  bool get password => _password;
  void loadingTrue(){
    loading =true;
    notifyListeners();
  }
  void passwordVisible() {
    _password = !_password;
    print(_password);
    notifyListeners();
  }
  IconData passwordState() {
    if (password == true) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  String? textFieldEmailValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال البريد الإلكتروني';
    } else {
      return null;
    }
  }

  String? textFieldPassWordValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال كلمة المرور';
    } else {
      return null;
    }
  }

  void sendDataToSignIn(context) {
    if (signInData.formKey.currentState!.validate()) {
      loadingTrue();
      postLogin(
          email: signInData.textEditingEmailController.text,
          context: context,
          password: signInData.textEditingPasswordController.text).then((value) =>  loading = false );
    }
  }

  Future<void> postLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    var head = <String, String>{
      "Content-Type": 'application/json',
    };

    Dio _dio = Dio();
    const url = "https://task.atc-servers.com/api/AccountSetting/Login";
    try {
      await _dio
          .post(url,
              data: jsonEncode({
                'email': email,
                'password': password,
              }),
              options: Options(
                followRedirects: false,
                receiveDataWhenStatusError: true,
                headers: head,
              ))
          .then((value) async {

        if (value.data['responseCode'] == 2) {
          showToast(
            message: value.data['responseMessage'],
            state: ToastStates.error,
          );
        } else {
          print(value.data['dateSet']['token']);
          CacheHelper.putDataInSharedPreference(
              value: value.data['dateSet']['token'], key: 'userToken');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
            (Route<dynamic> route) => false,
          );
        }
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    notifyListeners();
  }
}
