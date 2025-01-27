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
          SizedBox(
            height: 150,
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(100)
            ),
              child: Icon(
            Icons.notifications_off,
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            size: 100,
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            "No notifications.",
            style: GoogleFonts.prompt(
                color: Theme.of(context).colorScheme.primaryContainer, fontSize: 25,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
