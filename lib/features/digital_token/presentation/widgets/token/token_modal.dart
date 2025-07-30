import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/format/currency/currency.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/format/datetime/datetime.dart';

Widget buildTokenModalSheet(Token tokenItem,BuildContext context) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 1,
      builder: (_, controller) {

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tokenItem.name,
                          style: GoogleFonts.prompt(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text("By ${tokenItem.companyName}"),
                      ],
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
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      tokenItem.tokenType == "investment"
                          ? 'โทเคนเพื่อการลงทุน'
                          : 'โทเคนเพื่อการใช้ประโยชน์',
                      style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                           color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)
                          ),
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
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      '${tokenItem.tokenPrice.toStringAsFixed(2)} THB/${tokenItem.symbol}',
                      style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                           color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)
                          ),
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
                      "จำนวนโทเคนทั้งหมด",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      '${format.formatInt(tokenItem.totalSupply)} ${tokenItem.symbol}',
                      style: GoogleFonts.prompt(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                           color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)
                          ),
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
                      "ระยะเวลาในการจองซื้อ",
                      style: GoogleFonts.prompt(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'ตั้งแต่ ${datetime.formatStringDate(tokenItem.startDate)}',
                          style: GoogleFonts.prompt(
                              fontSize: 16,  color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)),
                        ),
                        Text(
                          'ถึง ${datetime.formatStringDate(tokenItem.endDate)}',
                          style: GoogleFonts.prompt(
                              fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)),
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
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      '${tokenItem.projectPeriod} ปี',
                      style:
                          GoogleFonts.prompt(fontSize: 16,  color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200)),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black12,
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 10, bottom: 10),
              //   child: Column(
              //     children: [
              //       Align(
              //         alignment: Alignment.topLeft,
              //         child: Text(
              //           "รายละเอียดเกี่ยวกับโทเคน",
              //           style: GoogleFonts.kanit(
              //               fontSize: 16, fontWeight: FontWeight.w500),
              //         ),
              //       ),
              //       Text(
              //         tokenItem.description,
              //         style: GoogleFonts.prompt(
              //           fontSize: 14,
              //           color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200 )
              //         ),
              //         textAlign: TextAlign.justify,
              //       )
              //     ],
              //   ),
              // ),
             
             
              ElevatedButton.icon(onPressed: (){}, icon: Icon(FontAwesomeIcons.newspaper,color: Theme.of(context).primaryColor,), label: Text("เอกสาร Whitepaper",style: GoogleFonts.kanit(fontSize: 16),))
            ],
          ),
        );
      },
    );
