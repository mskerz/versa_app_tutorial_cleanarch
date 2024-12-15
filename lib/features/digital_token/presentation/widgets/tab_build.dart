import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

Widget buildTokenList(List<Token> tokens, String status) {
  final filtered = tokens.where((token) => token.status == status).toList();

  if (filtered.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
        crossAxisAlignment:
            CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวนอน
        children: [
          Icon(Icons.generating_tokens_outlined,
              size: 50, // ขนาดไอคอน (ปรับตามต้องการ)
              color: Colors.grey[500] // สีไอคอน (ปรับตามต้องการ)
              ),
          SizedBox(height: 10), // เว้นระยะห่างระหว่างไอคอนกับข้อความ
          Text(
            'ยังไม่มีรายการโทเคน',
            style: GoogleFonts.prompt(
                fontSize: 18,
                color: Colors.grey[500] // สีไอคอน (ปรับตามต้องการ)
                ),
          ),
        ],
      ),
    );
  }

  return ListView.builder(
    itemCount: filtered.length,
    itemBuilder: (context, index) {
      final token = filtered[index];
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            print(token.name);
          },
          leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: const Icon(
                FontAwesomeIcons.info,
                color: Colors.white,
              )),
          title: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[200],
                ),
                child: Text(
                    token.tokenType == "investment"
                        ? 'โทเคนเพื่อการลงทุน'
                        : 'โทเคนเพื่อการใช้ประโยชน์',
                    style: CustomText(fontSize: 10)),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(token.name, style: CustomText(fontSize: 16))),
            ],
          ),
        ),
      );
    },
  );
}

TextStyle CustomText({
  double fontSize = 18.0, // กำหนดค่าเริ่มต้นเป็น 14.0
  Color color = Colors.black, // กำหนดค่าเริ่มต้นเป็นสีดำ
  FontWeight fontWeight = FontWeight.normal, // กำหนดค่าเริ่มต้นเป็นปกติ
  TextDecoration decoration =
      TextDecoration.none, // กำหนดค่าเริ่มต้นเป็นไม่มีขีดเส้นใต้
  double letterSpacing = 0.0, // กำหนดค่าเริ่มต้นเป็น 0.0
}) {
  return GoogleFonts.prompt(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing,
  );
}
