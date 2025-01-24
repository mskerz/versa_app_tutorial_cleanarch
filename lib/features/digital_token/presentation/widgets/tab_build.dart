import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/constants/assets.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

Widget buildTokenList(List<Token> tokens, String status, BuildContext context) {
  final filtered = tokens.where((token) => token.status == status).toList();
  print(filtered);
  if (filtered.isEmpty) {
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

  return ListView.builder(
    itemCount: filtered.length,
    itemBuilder: (context, index) {
      final token = filtered[index];
      return InkWell(
        onTap: () {
          context.router.push(TokenIntroRoute(tokenItem: token));
        },
        child: Material(
          color: Colors.transparent, // ทำให้ไม่แสดงพื้นหลัง
          child: Container(
            width: double.infinity, // ขยายไปจนเต็มหน้าจอ
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Token type (อยู่ข้างบนของไอคอน)
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
                    style: CustomText(fontSize: 10),
                  ),
                ),
                SizedBox(height: 8),
                // ไอคอน
                Row(
                  children: [
                    Container(
                      width: 50, // Set the size of the CircleAvatar
                      height: 50, // Set the size of the CircleAvatar
                      decoration: BoxDecoration(
                        shape:
                            BoxShape.circle, // Ensures the gradient is circular
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primaryContainer,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors
                            .transparent, // Make CircleAvatar's background transparent
                        child: Image.asset(
                          EXAMPLE_TOKEN_LOGO, // Your image path
                          width: 25,
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    // ชื่อของโทเคน
                    Text(
                      token.name,
                      style: CustomText(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
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
