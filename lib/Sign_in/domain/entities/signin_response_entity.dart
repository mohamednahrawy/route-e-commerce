class SignInResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;

  SignInResponseEntity({this.message, this.user, this.token, this.statusMsg});
}

class UserEntity {
  String? name;
  String? email;
  String? role;

  UserEntity({
    this.name,
    this.email,
    this.role,
  });
}


