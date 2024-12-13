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
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Row(
              children: [Icon(FontAwesomeIcons.diamond,size: 15,color: Colors.orangeAccent,),SizedBox(width: 5,),Text(token.tokenType =="investment"?'โทเคนดิจิทัลเพื่อการลงทุน':'โทเคนดิจิทัลเพื่อการใช้ประโยชน์')],
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        
                        color: Colors.blueAccent
                      ),
                      child: const Icon(
                            FontAwesomeIcons.coins,
                            color: Colors.yellow,
                            )),
            title: Text(token.symbol,style: CustomText(),),
            subtitle: Text(token.name,style: CustomText()),
            onTap: () {
              print(token.name);
            },
          ),
        ],
      );
    },
  );
}



TextStyle CustomText({
  double fontSize = 18.0,  // กำหนดค่าเริ่มต้นเป็น 14.0
  Color color = Colors.black,  // กำหนดค่าเริ่มต้นเป็นสีดำ
  FontWeight fontWeight = FontWeight.normal,  // กำหนดค่าเริ่มต้นเป็นปกติ
  TextDecoration decoration = TextDecoration.none,  // กำหนดค่าเริ่มต้นเป็นไม่มีขีดเส้นใต้
  double letterSpacing = 0.0,  // กำหนดค่าเริ่มต้นเป็น 0.0
}) {
  return GoogleFonts.prompt(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing,
  );
}