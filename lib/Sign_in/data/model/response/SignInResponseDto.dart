import '../../../domain/entities/signin_response_entity.dart';

class SignInResponseDto extends SignInResponseEntity {

  SignInResponseDto({super.message, super.user, super.token,super.statusMsg});

  SignInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;

    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    super.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}

