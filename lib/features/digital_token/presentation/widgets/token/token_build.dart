import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/token_card.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

 



 String getStatusFromIndex(int index) {
      switch (index) {
        case 0:
          return "All";
        case 1:
          return "ongoing";
        case 2:
          return "upcoming";
        case 3:
          return "finished";
        default:
          return "All";
      }
    }


 Widget buidToken(BuildContext context, List<Token> tokens, int selectedIndex) {
  final status = getStatusFromIndex(selectedIndex);
  final filterToken = status == "All"
      ? tokens
      : tokens.where((token) => token.status == status).toList();

  if (filterToken.isEmpty) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
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


 Widget buildTokenPreview(BuildContext context, List<Token> tokens, int selectedIndex) {
  final status = getStatusFromIndex(selectedIndex);
  final limitTokens = tokens.take(2).toList() ;
  final filterTokenOverview = status == "All" ? limitTokens : limitTokens.where((token) => token.status == status);
  if (filterTokenOverview.isEmpty) {
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
    children: filterTokenOverview.map((token) {
      return cardToken(context,item: token); // แสดงแต่ละรายการใน filterToken
    }).toList(),
  );
}