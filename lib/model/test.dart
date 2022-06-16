class AutoGenerate {
  int? responseCode;
  String? responseMessage;
  DateSet? dateSet;

  AutoGenerate.fromJson(Map<String, dynamic> json){
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    dateSet = DateSet.fromJson(json['dateSet']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['responseCode'] = responseCode;
    _data['responseMessage'] = responseMessage;
    _data['dateSet'] = dateSet!.toJson();
    return _data;
  }
}

class DateSet {

  int? pageNumber;
  int? pageSize;
  String? firstPage;
  String? lastPage;
  int? totalPages;
  int? totalRecords;
  String? nextPage;
  String? previousPage;
  List<Data>? data;
  bool? succeeded;
  Null errors;
  Null message;

  DateSet.fromJson(Map<String, dynamic> json){
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    firstPage = json['firstPage'];
    lastPage = json['lastPage'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
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

class Data {

   String? trxRef;
   String? userId;
   double? amount;
   String? trxDate;
   String? mobileNumber;
   String? fullNameAR;
   Null fullNameEN;
   Null thurayaNumber;

  Data.fromJson(Map<String, dynamic> json){
    trxRef = json['trxRef'];
    userId = json['userId'];
    amount = json['amount'];
    trxDate = json['trxDate'];
    mobileNumber = json['mobileNumber'];
    fullNameAR = json['fullNameAR'];
    fullNameEN = null;
    thurayaNumber = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trxRef'] = trxRef;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['trxDate'] = trxDate;
    _data['mobileNumber'] = mobileNumber;
    _data['fullNameAR'] = fullNameAR;
    _data['fullNameEN'] = fullNameEN;
    _data['thurayaNumber'] = thurayaNumber;
    return _data;
  }
}