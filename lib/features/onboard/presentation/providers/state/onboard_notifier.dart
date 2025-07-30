import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardNotifier extends StateNotifier<int> {
  OnboardNotifier() : super(0);  // เริ่มต้นที่หน้าแรก (index 0)
  
  // ฟังก์ชันสำหรับตั้งค่า index ให้ตรงกับหน้าที่ต้องการ
  void setIndex(int index) {
    state = index;  // ตั้งค่า index ใหม่
  }
  void goToNextPage() {
    if (state < 3) {
      state++;  // เปลี่ยนหน้าไปหน้าถัดไป
    }
  }

  void goToPreviousPage() {
    if (state > 0) {
      state--;  // กลับไปหน้าก่อนหน้า
    }
  }
}
