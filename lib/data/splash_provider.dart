import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hala_task/app/shard_pref.dart';
import 'package:hala_task/screens/auth/sing_in/sign_in_imports.dart';
import 'package:hala_task/screens/home/home_imports.dart';

import 'package:provider/provider.dart';

class SplashProvider extends ChangeNotifier{
  static SplashProvider get(context) => Provider.of<SplashProvider>(context,listen: false);
  gotoNextScreen(context) {
    Timer(const Duration(seconds: 3), () {
      CacheHelper.getDataFromSharedPreference(key: 'userToken')==null?
      Navigator.pushAndRemoveUntil
        (context, MaterialPageRoute(builder: (context)=>  LoginScreen()), (Route<dynamic> route) => false,):
      Navigator.pushAndRemoveUntil
        (context, MaterialPageRoute(builder: (context)=>   const HomeScreen()), (Route<dynamic> route) => false,);

      notifyListeners();
    }
    );
  }

}