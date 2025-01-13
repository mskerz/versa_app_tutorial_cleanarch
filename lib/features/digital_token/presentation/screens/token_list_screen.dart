import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/navigator_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/tab_build.dart';

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
    final tokenState = ref.watch(tokenNotifierProvider);

    final List<Token> tokenData = tokenState.tokenList;

    List<Widget> tabs = [
      Tab(text: 'โทเคนที่เปิดจองอยู่'),
      Tab(text: 'โทเคนที่ใกล้เปิดจอง'),
      Tab(text: 'โทเคนที่ปิดจองแล้ว'),
    ];

    List<Widget> tabViews = [
      buildTokenList(tokenData, 'open'),
      buildTokenList(tokenData, 'coming'),
      buildTokenList(tokenData, 'closed'),
    ];
    void _handleBackButtonPress() {
      final previousIndex =
          ref.read(transitionProvider.notifier).getPreviousIndex();

      if (previousIndex != null) {
        // เปลี่ยนไปยังเมนูที่เคยเปิด
        ref.read(transitionProvider.notifier).transitionTo(previousIndex);
      } else {
        // หากไม่พบ previousIndex ให้รีเซ็ตกลับไปยังหน้าแรก
        ref.read(transitionProvider.notifier).resetToHome();
      }

      // ย้อนกลับหน้าปัจจุบัน
      context.router.back();
    }

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                // กดย้อนกลับและเรียกใช้ getPreviousIndex เพื่อกลับไปยังเมนูที่เคยเปิดก่อนหน้า
                _handleBackButtonPress();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text("รายการโทเคน",
                  style: GoogleFonts.prompt(
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'ชำระเงินก่อนจะได้จัดสรรก่อน',
                style: GoogleFonts.prompt(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 112, 112, 112),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      physics:
                          const AlwaysScrollableScrollPhysics(), // ป้องกันการเลื่อนไปซ้ายสุด,
                      dividerHeight: 0,
                      labelColor: Colors.black,
                      tabAlignment: TabAlignment.start,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.orange,
                      labelPadding: EdgeInsets.symmetric(
                          horizontal: 20), // เพิ่ม padding เพื่อขยายแท็บ
                      indicator: MaterialIndicator(
                        color: Colors.orange,
                        height: 5,
                        topLeftRadius: 8,
                        topRightRadius: 8,
                        horizontalPadding: 50,
                        tabPosition: TabPosition.bottom,
                      ),
                      labelStyle: GoogleFonts.prompt(
                        textStyle: TextStyle(fontSize: 18.0),
                      ),
                      onTap: (index) {
                        ref
                            .read(selectedTabIndexProvider.notifier)
                            .changeTab(index);

                        print("current index : $selectIndexTab");
                      },
                      tabs: tabs),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: tabViews),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
