import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

@RoutePage()
class TokenIntroScreen extends StatelessWidget {
  final Token tokenItem;
  TokenIntroScreen(this.tokenItem, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isSoldOut = tokenItem.currentRaised == tokenItem.fundingGoal;
    String amountStatus = isSoldOut ? 'ขายหมดแล้ว' : 'ยังเปิดจองอยู่';
    if (tokenItem == null) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
      ),
      backgroundColor: Color(0xFF0A173E), // เปลี่ยนสีพื้นหลังเป็นสีฟ้า

      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: Center(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 30,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                        child: Icon(
                      Icons.token,
                      color: tokenItem.category == 'Technology'
                          ? Colors.lightBlueAccent
                          : tokenItem.category == 'Estate'
                              ? Colors.amber
                              : Colors.greenAccent,
                      size: 50,
                    )),
                    Center(
                      child: Text(
                        tokenItem.symbol,
                        style: GoogleFonts.kanit(
                            fontSize: 25,
                            color: const Color.fromARGB(27, 108, 108, 108)),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${tokenItem.name}',
                style: GoogleFonts.kanit(fontSize: 25, color: Colors.white),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isSoldOut ? Colors.grey : Colors.green,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    amountStatus,
                    style: GoogleFonts.kanit(color: Colors.white),
                  )),
              Spacer(), // This will push the ElevatedButton to the bottom

              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
