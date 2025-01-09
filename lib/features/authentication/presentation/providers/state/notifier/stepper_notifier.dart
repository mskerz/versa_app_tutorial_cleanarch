import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepStateNotifier extends StateNotifier<int> {
  StepStateNotifier() : super(0);

  // ฟังก์ชันไปยังขั้นตอนถัดไป
  void nextStep() {
    if (state != 2) {
      state += 1;
    }
  }

  // ฟังก์ชันย้อนกลับไปขั้นตอนก่อนหน้า
  void previousStep() {
    if (state != 0) {
      state -= 1;
    }
  }

 
  

  // ฟังก์ชันรีเซ็ตขั้นตอน
  void reset() {
    state = 0;
  }
}
