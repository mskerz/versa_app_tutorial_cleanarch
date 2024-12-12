import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenListScreen extends ConsumerStatefulWidget {
  const TokenListScreen({super.key});

  @override
  _TokenListScreenState createState() => _TokenListScreenState();
}

class _TokenListScreenState extends ConsumerState<TokenListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectIndexTab = ref.watch(selectedTabIndexProvider);

    final List<Widget> tabs = [
      Center(
          child: Text('โทเคนที่เปิดจองอยู่',
              style: GoogleFonts.prompt(
                  fontSize: 18.0, fontWeight: FontWeight.bold))),
      Center(
          child: Text('โทเคนที่ใกล้เปิดจอง',
              style: GoogleFonts.prompt(
                  fontSize: 18.0, fontWeight: FontWeight.bold))),
      Center(
          child: Text('โทเคนที่ปิดจองแล้ว',
              style: GoogleFonts.prompt(
                  fontSize: 18.0, fontWeight: FontWeight.bold))),
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
            Text("รายการโทเคน",
                style: GoogleFonts.prompt(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Text(
              'ชำระเงินก่อนจะได้จัดสรรก่อน',
              style: GoogleFonts.prompt(
                textStyle: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 112, 112, 112),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 16),
            // ใช้ SingleChildScrollView เมื่อมีจำนวนแท็บเยอะเกินไป
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // ทำให้ TabBar เลื่อนได้
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                dividerColor: Colors.transparent,
                labelColor: Colors.black, // สีข้อความในแท็บที่ถูกเลือก
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.orange,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 5.0,color: Colors.orange),
                    insets: EdgeInsets.symmetric(horizontal: 50.0)),
                labelStyle: GoogleFonts.prompt(
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                onTap: (index) {
                  ref.read(selectedTabIndexProvider.notifier).changeTab(index);
                  print("current index : $selectIndexTab");
                },
                tabs: [
                  Tab(text: 'โทเคนที่เปิดจองอยู่'),
                  Tab(text: 'โทเคนที่ใกล้เปิดจอง'),
                  Tab(text: 'โทเคนที่ปิดจองแล้ว'),
                ],
              ),
            ),
            // ใช้ TabBarView ที่ให้เลือกแท็บตาม selectIndexTab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  tabs[0],
                  tabs[1],
                  tabs[2],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
