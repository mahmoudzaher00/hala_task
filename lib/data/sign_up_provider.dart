import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hala_task/screens/auth/sign_up/sign_up_imports.dart';
import 'package:hala_task/screens/home/home_imports.dart';
import 'package:provider/provider.dart';
import '../app/functions.dart';

class SignUpProvider extends ChangeNotifier {
  static SignUpProvider get(context) => Provider.of<SignUpProvider>(context,);
  SignUpData signUpData=SignUpData();
  bool _password = true;
  bool get password => _password;
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
  String? textFieldPhoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال رقم الهاتف';
    } else {
      return null;
    }
  }
  String? textFieldFullNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال اسم المستخدم';
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
  void sendDataToRegister(context){
    if(signUpData.formKey.currentState!.validate()){
      if(signUpData.userRole==null){
        showToast(message: 'برجاء تحديد دور المستخدم',state: ToastStates.warning);
      }
      else{
        postSignUp(
          email: signUpData.textEditingEmailController.text,
          fullName: signUpData.textEditingFullNameController.text,
          context: context,
          password:signUpData.textEditingPasswordController.text,
          phoneNumber: signUpData.textEditingPhoneNumberController.text,
          roles: signUpData.userRole.toString(),
        );
      }

    }
  }

  void selectUserRole(value){
    signUpData.userRole=value.toString();
    notifyListeners();
  }

  Future<void> postSignUp ({required String email, required String fullName, required String password, required String phoneNumber, required String roles, required BuildContext context,}) async {

    var head = <String, String>{
      "Content-Type":'application/json',
    };

    Dio _dio= Dio() ;
    const url = "https://task.atc-servers.com/api/AccountSetting/Register";
    try {
      await _dio.post(
          url,
          data:jsonEncode({
            "FullName": fullName,
            "Email": email,
            "Password":password,
            "PhoneNumber": phoneNumber,
            "Roles": [
              roles
            ]
          }),
          options:Options(
            followRedirects: false,
            receiveDataWhenStatusError: true,
            headers: head,
          )
      ).then((value) async {
        if(value.data['responseCode']==2){
          showToast(
            message: value.data['dateSet'][0],
            state: ToastStates.error,
          );

        }
        else {
          print(value.data['dateSet']);
          Navigator.pushAndRemoveUntil
            (context, MaterialPageRoute(builder: (context)=>  HomeScreen()), (Route<dynamic> route) => false,);

        }


      }
      );
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