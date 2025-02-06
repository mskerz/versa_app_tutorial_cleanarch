import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/providers/ui_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token_build.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';

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
    final token = TokenInstanceProvider(ref);
      final theme = ref.watch(appThemeProvider);
      final selectedColor = theme == ThemeMode.dark ? Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.backgroundColor
        ?.resolve({}):Colors.white;
    final unselectedColor = Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.surfaceTintColor
        ?.resolve({});
 
 
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


  Widget buildButton(String label, int index) {
      return Container(
        padding: const EdgeInsets.symmetric( horizontal: 2),
        margin: const EdgeInsets.only(top: 10),
      
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: token.selectedButtonIndex == index
                  ? selectedColor
                  : unselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // ความโค้งของขอบ
                side: BorderSide(
                    color: token.selectedButtonIndex == index
                        ? Colors.white
                        : Color(0x4DFFFFFF),
                    width:
                        token.selectedButtonIndex == index ? 1 : 0.8), // ขอบของปุ่ม
              ),
            ),
            onPressed: () {
              token.buttonNotifier.selectButton(index);
            },
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 10),
            )),
      );
    }
     
    return AppScaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
       title: Text("Tokens",style: GoogleFonts.poppins(fontSize: 20),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
            color: Theme.of(context).primaryColor,
          ),
           IconButton(
                onPressed: () {
                  ref.read(appThemeProvider.notifier).toggleTheme();
                },
                icon: Icon(
                  ref.watch(appThemeProvider) == ThemeMode.dark
                      ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                ))
        ],
      ),
      body: AppBodyWithGredient(
        content: Container(
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
                      color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.only(top: 5,),
                  child: Row(
                    children: [
                      buildButton("All", 0),
                      buildButton("Ongoing", 1),
                      buildButton("Upcoming", 2),
                      buildButton("Finisned", 3)
                  
                    ],
                  ),
                ),
              Expanded(child: buildCardToken(context, token.tokenData, token.selectedButtonIndex))
            ],
          ),
        ),
      ),
    );
  }
}
