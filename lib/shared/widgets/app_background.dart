import 'dart:ui';

import 'package:flutter/material.dart';

class AppDefaultBackground extends StatelessWidget {
  final Widget? main_widget;
  const AppDefaultBackground({super.key,this.main_widget});

  @override

  Widget build(BuildContext context) {
    return Stack(children: [

 Positioned(
            top:-28,
            left: 219,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                
                gradient: RadialGradient(
            
                  colors: [
                        Color(0xFF2F5CFF),
                    Color(0xF78D1BBA),
                  ],
                ),
                borderRadius: BorderRadius.circular(60),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 250,
                  sigmaX: 250
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
      
      SizedBox(height: 130,),
    
      Positioned(
            top: 612,
            left: -64,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                
                gradient: RadialGradient(
            
                  colors: [
                    Color(0xFF2F5CFF),
                    Color(0xF78D1BBA),
                  ],
                ),
                borderRadius: BorderRadius.circular(60),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 250,
                  sigmaY: 250,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
      
      Padding(
      padding: EdgeInsets.only(top: 130),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withAlpha(1), // เพิ่มพื้นหลังให้ MainContainer
          borderRadius: BorderRadius.circular(16),
        ),
              child: main_widget ?? const SizedBox(),
      ),
    ),  
      ]);
  }
}