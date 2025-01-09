import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/datetime/datetime.dart';

Widget buildTokenModalSheet(Token tokenItem) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 1,
      builder: (_, controller) {
        DateTimeTH dateTimeTH = DateTimeTH();

        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            controller: controller,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.indigo,
                      radius: 30,
                      child: Container(
                          child: Icon(
                        Icons.token,
                        color: tokenItem.category == 'Technology'
                            ? Colors.lightBlueAccent
                            : tokenItem.category == 'Estate'
                                ? Colors.amber
                                : Colors.greenAccent,
                        size: 50,
                      )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      tokenItem.name,
                      style: GoogleFonts.prompt(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(FontAwesomeIcons.coins,
                        size: 18, color: Colors.orange),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "ประเภทของโทเคน",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      tokenItem.tokenType == "investment"
                          ? 'โทเคนเพื่อการลงทุน'
                          : 'โทเคนเพื่อการใช้ประโยชน์',
                      style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 18,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "ราคาโทเคนต่อหน่วย",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '${tokenItem.tokenPrice.toStringAsFixed(2)} THB/${tokenItem.symbol}',
                      style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.moneyBillTransfer,
                      size: 18,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "จองซื้อและชำระเงิน",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'ตั้งแต่ ${dateTimeTH.formatStringDate(tokenItem.startDate)}',
                          style: GoogleFonts.prompt(
                              fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'ถึง ${dateTimeTH.formatStringDate(tokenItem.endDate)}',
                          style: GoogleFonts.prompt(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // จัดตำแหน่งเนื้อหาทั้งหมดให้ชิดซ้าย

                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 16,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "ระยะเวลาโครงการ",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '${tokenItem.projectPeriod} ปี',
                      style:
                          GoogleFonts.prompt(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "รายละเอียดเกี่ยวกับโทเคน",
                        style: GoogleFonts.prompt(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      tokenItem.description,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            /*  Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Whitepaper",
                          style:
                              GoogleFonts.prompt(fontWeight: FontWeight.bold),
                        )),
                    Text(tokenItem.whitepaper.overview),
                    Column(
                      children: [
                        Text(tokenItem.whitepaper.problemStatement[0]),
                        Text(tokenItem.whitepaper.problemStatement[1]),
                      ],
                    ),
                    Column(
                      children: [
                        Text(tokenItem.whitepaper.solution[0]),
                        Text(tokenItem.whitepaper.solution[1]),
                      ],
                    ),
                  ],
                ),
              ) */
            ],
          ),
        );
      },
    );
