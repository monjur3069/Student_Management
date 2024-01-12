class LoginModel {
  String? error;
  LoginModel({
      this.result, 
      this.token,});

  LoginModel.fromJson(dynamic json) {
    result = json['result'];
    token = json['token'];
  }
  bool? result;
  String? token;
LoginModel copyWith({  bool? result,
  String? token,
}) => LoginModel(  result: result ?? this.result,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['token'] = token;
    return map;
  }

  LoginModel.withError(String errorMessage){
    error = errorMessage;
  }
}