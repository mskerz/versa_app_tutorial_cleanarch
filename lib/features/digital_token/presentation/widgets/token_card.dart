    import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/datetime/datetime.dart';

Widget cardToken(BuildContext context,{required Token? item}) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 8,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0x0D898989).withAlpha(30),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Color(0x17FFFFFF)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 62, 200, 255),
                    Color.fromARGB(255, 141, 149, 255)
                  ])),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item!.name,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${datetime.formatDateStartToEnd(item.startDate, item.endDate)}',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(item.tokenPrice.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          color: Theme.of(context).primaryColor)),
                  Text('THB/Token',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        fontSize: 8,
                        height: 1.8,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    }


