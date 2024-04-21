class LoginModel
{
  late final String id;
  late final String authKey;
  LoginModel.fromJson(Map<String,dynamic> json)
  {
     id=json['id'];
     authKey=json['auth_key'];
  }
}