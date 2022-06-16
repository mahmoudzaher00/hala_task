import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hala_task/model/home_model.dart';
import 'package:hala_task/model/test.dart';
import 'package:dio/dio.dart' as Dioo;
import 'package:dio/dio.dart';

import '../shared/networking/remote/dio_helper.dart';

class SignInProvider extends ChangeNotifier {
  bool _password = true;

  bool get password => _password;
  AutoGenerate? autoGenerate;

  void onClick() {
    _password = !_password;
    notifyListeners();
  }

  Future<AutoGenerate?> postSignIn({
    required BuildContext context,
    required HomeModel model,
  }) async {
    try {
      await DioHelper.postData(url: '/HalaPayments', data: model.toJson())
          .then((value) {
        print(value.data);
        if (value.statusCode == 200) {
          autoGenerate = AutoGenerate.fromJson(value.data);
          //  CacheHelper.putDataInSharedPreference(value: value.data['data']['token'], key: 'info');
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeServiceScreen(),), (Route<dynamic> route) => false,);

        } else if (value.statusCode == 404 || value.statusCode == 422) {
          print(value.data['message']);
        } else {
          print(value.data['message']);
        }
      }).catchError((error) {
        print(error.toString());
        notifyListeners();
      });
    } catch (e) {
      print('>>>>>>>>>>>$e');
    }

    notifyListeners();
    return autoGenerate;
  }

  Future<AutoGenerate?> postUnBlock(
  {required int pageKey, required int pageNum}
      // required  HomeModel model
      ) async {
    var head = <String, String>{
      "Content-Type": 'application/json',
      'Authorization':
          "Bearer ${'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJjNGRlNWRiNS1iNDM3LTRkNTctODYwMC1iYjIzM2Q5NDE4Y2UiLCJlbWFpbCI6InpAZ2Fzcy5jb20iLCJqdGkiOiIzN2VkODhlZS00MjA1LTRlZjgtOTU3Ny1hYzdkYmUxNjNiNDYiLCJyb2xlIjoiQWRtaW4iLCJuYmYiOjE2NTUzMTQ1NDAsImV4cCI6MTY1NTM1Nzc0MCwiaWF0IjoxNjU1MzE0NTQwLCJpc3MiOiJNdWx0aUNob2ljZUx0ZCIsImF1ZCI6Ik11bHRpQ2hvaWNlTHRkIn0.cIlnugG81ll1ePRL__ChOHUw79MkMLCdti3s_ubmNyg'}",
      //'Authorization': 'Bearer ${_getInfo.read('info')}' ,
    };

    Dio _dio = Dio();

    const url = "https://task.atc-servers.com/api/HalaTaskFlutter/HalaPayments";
    try {
      final response = await _dio
          .post(url,
              data: {
                "FromDate": "2020-01-01",
                "ToDate": "2022-05-01",
                "filter": {"PageNumber":pageKey, "PageSize": pageNum}
              },
              // jsonEncode({
              //   {
              //     "FromDate": "2020-01-01",
              //     "ToDate": "2022-05-01",
              //     "filter": {
              //       "PageNumber": 4,
              //       "PageSize": 10
              //     }
              //   }
              //

              options: Options(
                followRedirects: false,
                receiveDataWhenStatusError: true,
                headers: head,
              ))
          .then((value) async {
        if (value.data['status'] == 'false') {
          print(value.data['message']);
        } else {
          autoGenerate = AutoGenerate.fromJson(value.data);
          print(autoGenerate!.responseMessage);


          // Fluttertoast.showToast(
          //   msg: '${unBlockModel!.msg} ',
          //   fontSize: 18,
          //   backgroundColor:AppColors.orange,
          //   gravity: ToastGravity.BOTTOM,
          //   textColor: Colors.white,
          //   toastLength: Toast.LENGTH_LONG,
          //   // timeInSecForIosWeb: 1
          // );
          // CachHelper.putDataInSharedPreference(value: loginModel!.success!.token, key: 'info');
          // print(CachHelper.getDataFromSharedPreference(key: 'info'));
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavBarScreen(),), (Route<dynamic> route) => false,);

        }
      });

      print(response);
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

    return autoGenerate;
  }
}
