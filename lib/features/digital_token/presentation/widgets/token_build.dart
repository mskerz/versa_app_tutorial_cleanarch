import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token_card.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

 
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


 String getStatusFromIndex(int index) {
      switch (index) {
        case 0:
          return "All";
        case 1:
          return "open";
        case 2:
          return "coming";
        case 3:
          return "closed";
        default:
          return "All";
      }
    }


 Widget buildCardToken(BuildContext context, List<Token> tokens, int selectedIndex) {
  final status = getStatusFromIndex(selectedIndex);
  final filterToken = status == "All"
      ? tokens
      : tokens.where((token) => token.status == status).toList();

  if (filterToken.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.generating_tokens_outlined,
            size: 50,
            color: Colors.grey[500],
          ),
          SizedBox(height: 10),
          Text(
            'ยังไม่มีรายการโทเคน',
            style: GoogleFonts.prompt(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  // ถ้า filterToken ไม่ว่าง
  return ListView(
    padding: EdgeInsets.all(8),
    children: filterToken.map((token) {
      return cardToken(context,item: token); // แสดงแต่ละรายการใน filterToken
    }).toList(),
  );
}


 Widget buildCardTokenLimited(BuildContext context, List<Token> tokens, int selectedIndex) {
  final status = getStatusFromIndex(selectedIndex);
  final filterTokenLimited = status == "All"
      ? tokens
      : tokens.where((token) => token.status == status).take(3).toList();

  if (filterTokenLimited.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.generating_tokens_outlined,
            size: 50,
            color: Colors.grey[500],
          ),
          SizedBox(height: 10),
          Text(
            'ยังไม่มีรายการโทเคน',
            style: GoogleFonts.prompt(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  // ถ้า filterToken ไม่ว่าง
  return ListView(
    padding: EdgeInsets.all(8),
    children: filterTokenLimited.map((token) {
      return cardToken(context,item: token); // แสดงแต่ละรายการใน filterToken
    }).toList(),
  );
}