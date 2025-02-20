import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/format/currency/currency.dart';

class OrderCard extends ConsumerWidget {
  final double amount;
  final double tokenPrice;
  final String tokenName;
  final String dateTime;
  final int orderStatus; // 0 pending 1 completed 2 failed
  final String tokenSymbol;

  const OrderCard(
      {Key? key,
      required this.amount,
      required this.tokenPrice,
      required this.orderStatus, // 0 pending 1 completed 2 failed
      required this.tokenName,
      required this.dateTime,
      required this.tokenSymbol})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final totalValue = format.format((amount * tokenPrice));
    final status = orderStatus == 0
        ? "Pending"
        : orderStatus == 1
            ? "Completed"
            : "Failed";
    final statusContainerColor = orderStatus == 0
        ? LinearGradient(colors: [Color(0xFFFBA948), Color(0xFFFEC345)])
        : orderStatus == 1
            ? LinearGradient(colors: [Color(0xFF78E59E), Color(0xFF00B9C3)])
            : LinearGradient(colors: [
                Color.fromARGB(255, 255, 66, 66),
                Color.fromARGB(0, 255, 91, 91)
              ]);
    Widget buildContainerItem() {
      return Container(
        width: widthScreen,
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(30, 139, 139, 139),

          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: const Color.fromARGB(9, 255, 255, 255),
              width: 1.5), // สีขอบ + ความหนา
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Token Logo
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  tokenName[0].toUpperCase(),
                  style: TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Token Name
                Text(
                  tokenName,
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      '${tokenPrice.round()} THB/$tokenSymbol',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor.withAlpha(204),
                        fontSize: 9,
                        height: 13.5 / 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${amount.round()} $tokenSymbol',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor.withAlpha(204),
                        fontSize: 9,
                        height: 13.5 / 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),

            Spacer(),

            // Amount

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$totalValue',
                  style: GoogleFonts.poppins(
                      color: Color(0xFF49CE77),
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '$dateTime',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                      color: Color(0xFF818181),
                      fontSize: 8,
                      height: 1,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  width:65,
                  height: 24,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: statusContainerColor),
                  child: Text(
                    '$status',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 8,
                        
                        height: 0.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        Positioned(
          top: 52,
          left: 335,
          child: Transform.rotate(
            angle: pi / 2,
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // เลือกระดับเบลอ
              child: Container(
                width: 56,
                decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(19, 64, 226, 0), // เริ่มจากโปร่งใส
                        Color.fromRGBO(19, 64, 226, 0.6), // แสงที่กระทบ
                        Color.fromRGBO(19, 64, 226, 0), // สิ้นสุดที่โปร่งใส
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        buildContainerItem(),
      ],
    );
  }
}
