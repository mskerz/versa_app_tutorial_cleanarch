import 'package:flutter_riverpod/flutter_riverpod.dart';

// สร้าง HoverNotifier ที่ใช้จัดการสถานะการเปลี่ยนแปลงของการกด
class HoverNotifier extends StateNotifier<bool> {
  HoverNotifier() : super(false); // ค่าเริ่มต้นเป็น false

  void onTap() {
    state = !state; // เปลี่ยนสถานะเมื่อมีการ tap
  }

  void onLongPress() {
    state = true; // กดค้าง เปลี่ยนสถานะเป็น true
  }

  void onTapCancel() {
    state = false; // เมื่อยกเลิกการ tap ค้าง เปลี่ยนสถานะเป็น false
  }
}

// สร้าง provider
final hoverProvider = StateNotifierProvider<HoverNotifier, bool>((ref) => HoverNotifier());
