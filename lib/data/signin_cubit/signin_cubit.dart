import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  static SigninCubit get(context)=>BlocProvider.of(context);
  bool _password = true;
  bool get password => _password;

  void onClick() {
    emit(InvisiblePassword());
    _password = !_password;
    emit(VisiblePassword());
  }
  IconData passwordState (){
    if(password==true){
      return Icons.visibility;
    }else{
      return  Icons.visibility_off;
    }

  }

}
