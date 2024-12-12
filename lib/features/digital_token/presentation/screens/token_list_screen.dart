import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/test_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenListScreen extends ConsumerWidget {
  const TokenListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedTabIndex = ref.watch(selectedTabIndexProvider);

    final List<Widget> tabs = [
      Center(
          child: Text('โทเคนที่เปิดจองอยู่',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
      Center(
          child: Text('โทเคนที่ใกล้เปิดจอง',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
      Center(
          child: Text('โทเคนเพื่อการลงทุน',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is Google Fonts',
              style: GoogleFonts.kanit(),
            ),
            // Text("รายการโทเคน", d
            //     style: GoogleFonts.prompt(
            //       textStyle: TextStyle(
            //         fontSize: 20.0,

            //       ),
            //     )),
            Text(
              'ชำระเงินก่อนจะได้จัดสรรก่อน',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 112, 112, 112),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
