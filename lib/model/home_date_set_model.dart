import 'package:hala_task/model/home_payment_model.dart';

import 'home_data_model.dart';

class HomeDateSetModel {

  int? pageNumber;
  int? pageSize;
  String? firstPage;
  String? lastPage;
  int? totalPages;
  int? totalRecords;
  String? nextPage;
  String? previousPage;
  List<HomeDataModel>? data;
  bool? succeeded;
  Null errors;
  Null message;

  HomeDateSetModel.fromJson(Map<String, dynamic> json){
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    firstPage = json['firstPage'];
    lastPage = json['lastPage'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    data = List.from(json['data']).map((e)=>HomeDataModel.fromJson(e)).toList();
    succeeded = json['succeeded'];
    errors = null;
    message = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pageNumber'] = pageNumber;
    _data['pageSize'] = pageSize;
    _data['firstPage'] = firstPage;
    _data['lastPage'] = lastPage;
    _data['totalPages'] = totalPages;
    _data['totalRecords'] = totalRecords;
    _data['nextPage'] = nextPage;
    _data['previousPage'] = previousPage;
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    _data['succeeded'] = succeeded;
    _data['errors'] = errors;
    _data['message'] = message;
    return _data;
  }
}