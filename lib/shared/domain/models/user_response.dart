import 'package:versa_app_tutorial_cleanarch/shared/domain/models/models.dart';

class UserResponse {
  final String message;
  final User user;
  bool isloggedIn;
  UserResponse({required this.message,required this.user,this.isloggedIn =false});


  // Factory constructor to create an instance from JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      message: json['message'],
      user: json['user'],
    );
  }

    // Method to create a copy of the current UserResponse with new isloggedIn value
  UserResponse copyWith({bool? isloggedIn}) {
    return UserResponse(
      message: message,
      user: user,
      isloggedIn: isloggedIn ?? this.isloggedIn, // ใช้ค่าเดิมถ้าไม่ระบุ
    );
  }
}