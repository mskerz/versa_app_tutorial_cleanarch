import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // ใช้ Center เพื่อให้ตรงกลางทั้งแนวตั้งและแนวนอน
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // ตรงกลางแนวตั้ง
        crossAxisAlignment: CrossAxisAlignment.center, // ตรงกลางแนวนอน
        mainAxisSize: MainAxisSize.min, // ให้ Column มีขนาดเท่าที่จำเป็น
        children: [
         
          Icon(
                      Icons.notifications_off,
                      color: Theme.of(context).primaryColor.withAlpha(50),
                      size: 60,
                    ),
          SizedBox(
            height: 10,
          ),
          Text(
            "No notifications.",
            style: GoogleFonts.prompt(
                color: Theme.of(context).primaryColor.withAlpha(80), fontSize: 18,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
