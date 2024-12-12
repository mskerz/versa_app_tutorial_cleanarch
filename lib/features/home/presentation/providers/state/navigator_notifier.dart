import 'package:flutter_riverpod/flutter_riverpod.dart';




class AnimateTransitionNotifier extends StateNotifier<IndicatorState>{
  AnimateTransitionNotifier() : super(IndicatorState(true, 0));


  
  // ฟังก์ชันสำหรับสลับสถานะ visibility และการเลื่อนตำแหน่ง
   // Fade Out และเปลี่ยนตำแหน่ง
  Future<void> transitionTo(int index) async {
    // Fade Out
    state = IndicatorState(false, state.index);
    await Future.delayed(const Duration(milliseconds: 300)); // หน่วงเวลา 300ms (เวลา Fade Out)

    // เปลี่ยนตำแหน่งหลัง Fade Out
    state = IndicatorState(true, index);
  }

  void reset(){

  }

  // ฟังก์ชันสำหรับ reset ทุกครั้งที่เลือกเมนูใหม่
  

}

// สร้างคลาสสำหรับเก็บข้อมูลของ Indicator
class IndicatorState {
  final bool isVisible;
  final int index;

  IndicatorState(this.isVisible, this.index);
}

