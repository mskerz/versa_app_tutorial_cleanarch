class LoginResponse {
  final String? message;
  final String? idToken;
  final String? refreshToken;

    LoginResponse({
    this.message, // ไม่จำเป็นต้องกำหนดค่า
    this.idToken, // ไม่จำเป็นต้องกำหนดค่า
    this.refreshToken, // ไม่จำเป็นต้องกำหนดค่า
  });

  // Factory constructor to create an instance from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      idToken: json['idToken'],
      refreshToken: json['refreshToken'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'idToken': idToken,
      'refreshToken': refreshToken,
    };
  }
}
