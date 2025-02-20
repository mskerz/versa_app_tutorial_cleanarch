import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class TokenWalletItemCard extends ConsumerWidget {
  final double amount;
  final String tokenName;
  final String tokenSymbol;

  const TokenWalletItemCard({
    Key? key,
    required this.amount,
    required this.tokenName,
    required this.tokenSymbol
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    final ui = UIInstanceProvider(ref);
    print('$heightScreen x $widthScreen');
    Widget buildContainerItem(){
      return Container(
      width: widthScreen,
      height: 90,
      margin: const EdgeInsets.symmetric( vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(30, 139, 139, 139),

         borderRadius: BorderRadius.circular(16),
             border: Border.all(color: const Color.fromARGB(9, 255, 255, 255), width: 1.5), // สีขอบ + ความหนา
        boxShadow: ui.themeMode == ThemeMode.dark ? [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ]:[]
        ,
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
          
          // Token Name
          Text(
            tokenName,
            style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          Spacer(),
          
          // Amount
           
          Row(
            children: [
              Text(
                '${amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
               ' $tokenSymbol',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          )
       ,
       

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
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0), // เลือกระดับเบลอ
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
             ui.themeMode== ThemeMode.dark ?   Color.fromRGBO(19, 64, 226, 0.6) :Color.fromRGBO(0, 0, 0, 0.133), // แสงที่กระทบ
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