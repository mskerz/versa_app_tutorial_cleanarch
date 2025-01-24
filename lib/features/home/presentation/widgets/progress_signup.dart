import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

// ฟังก์ชันที่ใช้แสดง progress bar ถ้าผู้ใช้ล็อกอินแล้ว
Widget buildLoggedInProgressBar(double progress, double percent, BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              '${percent.floor()}%',
              style: GoogleFonts.prompt(fontSize: 12,color: Theme.of(context).primaryColor),
            ),
            Container(
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "การสมัครของคุณยังไม่เสร็จสมบูรณ์",
            style:
                GoogleFonts.prompt(color: Theme.of(context).primaryColor, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            "กรุณาสมัครให้สำเร็จก่อนทำการจองซื้อโทเคน",
            style: GoogleFonts.prompt(                  color: Theme.of(context).primaryColor, fontSize: 14),
          ),
        ],
      ),
    ],
  );
}

// ฟังก์ชันที่ใช้แสดงข้อความเมื่อผู้ใช้ยังไม่ได้ล็อกอิน
Widget buildUnloggedInMessage(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // จัดกึ่งกลาง
    children: [
      Text(
        "กรุณา",
        style: GoogleFonts.prompt(
          fontSize: 16,
          color: Colors.black, // ปรับสีให้เหมาะสม
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click, // ตั้งค่าเคอร์เซอร์เป็น Pointer
        child: TextButton(
          onPressed: () {
            context.router.push(LoginRoute());
          },
          child: Text(
            "เข้าสู่ระบบ",
            style: GoogleFonts.prompt(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      Text(
        "ก่อนการจองซื้อโทเคน",
        style: GoogleFonts.prompt(
          fontSize: 16,
          color: Colors.black, // ใช้สีเดียวกับข้อความแรก
        ),
      ),
    ],
  );
}
