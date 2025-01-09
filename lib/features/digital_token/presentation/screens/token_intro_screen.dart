import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token_modal.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';

@RoutePage()
class TokenIntroScreen extends StatelessWidget {
  final Token tokenItem;
  TokenIntroScreen(this.tokenItem, {super.key});

  @override

  Widget build(BuildContext context) {
    bool isSoldOut = tokenItem.currentRaised == tokenItem.fundingGoal;
    bool isComing = tokenItem.status == "coming";
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
              isSoldOut
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        amountStatus,
                        style: GoogleFonts.kanit(color: Colors.white),
                      ))
                  : !isComing
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set the background color
                            foregroundColor: Colors.white, // Set the text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5), // ลด padding
                          ),
                          onPressed: () {},
                          child: Text("เปิดจอง"))
                      : Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "ใกล้เปิดจอง",
                            style: GoogleFonts.kanit(color: Colors.white),
                          )),
              Spacer(), // This will push the ElevatedButton to the bottom

              // GestureDetector + ElevatedButton
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF0A173E),
                  ),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: IconButton.filled(
                    onPressed: () => showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) => buildTokenModalSheet(tokenItem)),
                    icon: const Icon(
                      FontAwesomeIcons.arrowDown,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
