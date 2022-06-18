import 'package:hala_task/model/home_date_set_model.dart';

class HomePaymentModel {
  int? responseCode;
  String? responseMessage;
  HomeDateSetModel? dateSet;

  HomePaymentModel.fromJson(Map<String, dynamic> json){
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    dateSet = HomeDateSetModel.fromJson(json['dateSet']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['responseCode'] = responseCode;
    _data['responseMessage'] = responseMessage;
    _data['dateSet'] = dateSet!.toJson();
    return _data;
  }
}



