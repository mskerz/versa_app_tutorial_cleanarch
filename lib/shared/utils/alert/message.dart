class ErrorHandler {
  // ฟังก์ชันสำหรับ status code 400
  String getErrorMessage400(String screen) {
    switch (screen) {
      case "signup":
      return "อีเมลที่คุณสมัครมีผู้ใช้งานแล้ว กรุณาลองใหม่อีกครั้ง";
      case "login":
        return "อีเมลหรือรหัสผ่านของคุณไม่ถูกต้อง. กรุณาลองใหม่อีกครั้ง";
      default:
        return "Request ไม่ถูกต้อง (Bad Request)";
    }
  }

  // ฟังก์ชันสำหรับ status code 401
  String getErrorMessage401() {
    return "คุณต้องเข้าสู่ระบบก่อน (Unauthorized)";
  }

  // ฟังก์ชันสำหรับ status code 403
  String getErrorMessage403() {
    return "คุณไม่มีสิทธิ์เข้าถึง (Forbidden)";
  }

  // ฟังก์ชันสำหรับ status code 404
  String getErrorMessage404() {
    return "ไม่พบข้อมูลที่ต้องการ (Not Found)";
  }

  // ฟังก์ชันสำหรับ status code 500
  String getErrorMessage500() {
    return "เกิดข้อผิดพลาดที่เซิร์ฟเวอร์ (Internal Server Error)";
  }

  // ฟังก์ชันสำหรับ status code อื่นๆ
  String getErrorMessage(int statusCode, String screen) {
    switch (statusCode) {
      case 400:
        return getErrorMessage400(screen);
      case 401:
        return getErrorMessage401();
      case 403:
        return getErrorMessage403();
      case 404:
        return getErrorMessage404();
      case 500:
        return getErrorMessage500();
      default:
        return "เกิดข้อผิดพลาดบางประการ";
    }
  }
}


