import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';

class UserResponse {
  final String message;
  final User user;

  UserResponse({required this.message,required this.user});


  // Factory constructor to create an instance from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      message: json['message'],
      user: json['user'],
    );
  }

   
}