import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hala_task/app/shard_pref.dart';
import 'package:hala_task/model/home_payment_model.dart';

import 'package:hala_task/screens/auth/sing_in/sign_in_imports.dart';
import 'package:hala_task/screens/home/home_imports.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  static HomeProvider get(context) => Provider.of<HomeProvider>(
        context,
      );
  HomePaymentModel? homePaymentModel;
  HomeData homeData=HomeData();

  Future<HomePaymentModel?> pagingPaymentList({required int pageKey, required int pageNum,context}) async {
    var head = <String, String>{
      "Content-Type": 'application/json',
      'Authorization': "Bearer ${CacheHelper.getDataFromSharedPreference(key: 'userToken')}",
    };

    Dio dio = Dio();
    const url = "https://task.atc-servers.com/api/HalaTaskFlutter/HalaPayments";
    try {
     var response= await dio.post(url, data: {
                "FromDate": "2020-01-01",
                "ToDate": "2022-05-01",
                "filter": {"PageNumber": pageKey, "PageSize": pageNum}
              },
              options: Options(
                followRedirects: false,
                receiveDataWhenStatusError: true,
                headers: head,
              ));

            if(response.statusCode==200){
          if (response.data['responseCode'] != 1) {
                print(response.data['responseCode']);
              } else {
                homePaymentModel = HomePaymentModel.fromJson(response.data);
              }
            }
            else if(response.statusCode==401){
          CacheHelper.clearDataFromSharedPreference(key: 'userToken').then((value) =>
                  Navigator.pushAndRemoveUntil
                    (context, MaterialPageRoute(builder: (context)=>  LoginScreen()), (Route<dynamic> route) => false,)
              );
            }
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

    return homePaymentModel;
  }
}
