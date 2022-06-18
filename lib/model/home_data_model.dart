class HomeDataModel {

  String? trxRef;
  String? userId;
  double? amount;
  String? trxDate;
  String? mobileNumber;
  String? fullNameAR;


  HomeDataModel.fromJson(Map<String, dynamic> json){
    trxRef = json['trxRef'];
    userId = json['userId'];
    amount = json['amount'];
    trxDate = json['trxDate'];
    mobileNumber = json['mobileNumber'];
    fullNameAR = json['fullNameAR'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trxRef'] = trxRef;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['trxDate'] = trxDate;
    _data['mobileNumber'] = mobileNumber;
    _data['fullNameAR'] = fullNameAR;
    return _data;
  }
}