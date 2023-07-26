class ResponseModel{
  bool _isSuccess;
  dynamic _message;
  ResponseModel(this._isSuccess,this._message);
  String get message=> _message;
  bool get isSuccess=> _isSuccess;
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}





// class ServerResponse {
//   final User user;
//   final Token token;

//   ServerResponse({required this.user, required this.token});

//   factory ServerResponse.fromJson(Map<String, dynamic> json) {
//     return ServerResponse(
//       user: User.fromJson(json['payload']['user']),
//       token: Token.fromJson(json['payload']['token']),
//     );
//   }
// }

// class User {
//   final String email;
//   final String username;
//   final int id;
//   final int exp;

//   User({required this.email, required this.username, required this.id, required this.exp});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       email: json['email'],
//       username: json['username'],
//       id: json['id'],
//       exp: json['exp'],
//     );
//   }
// }

// class Token {
//   final String accessToken;
//   final String refreshToken;

//   Token({required this.accessToken, required this.refreshToken});

//   factory Token.fromJson(Map<String, dynamic> json) {
//     return Token(
//       accessToken: json['access_token'],
//       refreshToken: json['refresh_token'],
//     );
//   }
// }
