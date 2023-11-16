
class RegisterResponseEntity {
  UserEntity? user;
  String? token;

  RegisterResponseEntity({
    this.user,
    this.token,
  });
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({
    this.name,
    this.email,
  });
}




// String? statusMsg;
// String? message;
// PhoneError? error;
// this.statusMsg,
// this.message,
// this.error

// String? role;
// this.role,
