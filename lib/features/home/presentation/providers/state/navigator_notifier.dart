import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimateTransitionNotifier extends StateNotifier<IndicatorState> {
  AnimateTransitionNotifier() : super(IndicatorState(true, 0));

  int? previousIndex; // ตัวแปรเพื่อเก็บดัชนีของเมนูก่อนหน้า

  // ฟังก์ชันสำหรับสลับสถานะ visibility และการเลื่อนตำแหน่ง
  // Fade Out และเปลี่ยนตำแหน่ง
Future<void> transitionTo(int index) async {
    // เก็บค่า index ก่อนหน้านี้
    previousIndex = state.index;

    // ถ้า index == -1 (หมายถึงการกดปุ่ม Back จากหน้าอื่น เช่น Setting)
    if(index == -1){ 
       // ควรทำการกลับไปที่หน้าก่อนหน้านี้
       // ตรวจสอบก่อนว่า previousIndex มีค่าอะไร และทำการเปลี่ยนไปยังหน้าที่ต้องการ
       return;
    }
    
    // ทำ Fade Out
    state = IndicatorState(false, state.index);
    await Future.delayed(const Duration(milliseconds: 300)); // หน่วงเวลา 300ms (เวลาที่ใช้ในการ Fade Out)
    print(state.index);

    // เปลี่ยนตำแหน่งหลังจาก Fade Out
    state = IndicatorState(true, index);
}

  // เมื่อกลับหน้า Home จะต้องรีเซ็ต index

  void resetToHome() {
    state = IndicatorState(true, 0); // ตั้งค่าให้เป็นหน้าแรก
  }

  // ฟังก์ชันสำหรับคืนค่า index ก่อนหน้า
  int? getPreviousIndex() {
    return previousIndex; // คืนค่า index ก่อนหน้านี้
  }

  // ฟังก์ชันสำหรับ reset ทุกครั้งที่เลือกเมนูใหม่
}

// สร้างคลาสสำหรับเก็บข้อมูลของ Indicator
class IndicatorState {
  final bool isVisible;
  final int index;

  IndicatorState(this.isVisible, this.index);
}
