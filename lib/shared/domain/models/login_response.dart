class LoginResponse {
  final String? message;
  final String? idToken;
  final String? expirationTime;
    LoginResponse({
    this.message, // ไม่จำเป็นต้องกำหนดค่า
    this.idToken, // ไม่จำเป็นต้องกำหนดค่า
    this.expirationTime
  });

  // Factory constructor to create an instance from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      idToken: json['idToken'],
      expirationTime: json['expiration'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'idToken': idToken,
    };
  }
}
