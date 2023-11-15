
class SignInResponseDto {
  SignInResponseDto({this.message, this.user, this.token, this.failure});

  SignInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    failure = json['failure'] != null
        ? SignInFailureDto.fromJson(json['failure'])
        : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
  SignInFailureDto? failure;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (failure != null) {
      map['failure'] = failure?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}

class SignInFailureDto {
  SignInFailureDto({
    this.statusMsg,
    this.message,
  });

  SignInFailureDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }
}
