class RegisterUser{
  String email;
  String name;
  String password;
  String passwordConfirm;

  RegisterUser({
    required this.email,
    required this.name,
    required this.password,
    required this.passwordConfirm
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email']=this.email;
    data['username']=this.name;
    data['password']=this.password;
    data['password2']=this.passwordConfirm;
    return data;
  }
}