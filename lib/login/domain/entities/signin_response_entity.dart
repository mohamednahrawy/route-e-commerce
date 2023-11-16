class SignInResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  SignInFailureEntity? failure;

  SignInResponseEntity({this.message, this.user, this.token, this.failure});
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

class SignInFailureEntity {
  String? statusMsg;
  String? message;

  SignInFailureEntity({
    this.statusMsg,
    this.message,
  });
}
