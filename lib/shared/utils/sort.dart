
class Sort {
    static final Sort _instance = Sort._internal();
  Sort._internal();

   // สร้าง factory method เพื่อให้ได้ instance เดียว
  factory Sort() {
    return _instance;
  }
  // ฟังก์ชันสำหรับการจัดเรียงจากน้อยไปมาก
  List<T> sort_byASC<T>(List<T> data, bool Function(T) check) {
    // ใช้ compare เพื่อเรียงลำดับตามค่า isRead
    data.sort((a, b) {
      bool aIsRead = check(a); 
      bool bIsRead = check(b);
      if (aIsRead == bIsRead) return 0;
      return aIsRead ? 1 : -1; // false มาอยู่ข้างหน้า
    });
    return data;
  }

  // ฟังก์ชันสำหรับการจัดเรียงจากมากไปน้อย
  List<T> sort_byDESC<T>(List<T> data, bool Function(T) check) {
    // ใช้ compare เพื่อเรียงลำดับตามค่า isRead
    data.sort((a, b) {
      bool aIsRead = check(a);
      bool bIsRead = check(b);
      if (aIsRead == bIsRead) return 0;
      return aIsRead ? -1 : 1; // false มาอยู่ข้างหน้า
    });
    return data;
  }
}
