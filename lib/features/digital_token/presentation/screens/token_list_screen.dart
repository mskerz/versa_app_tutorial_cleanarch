
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/token_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/widget.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

class TokenListScreen extends ConsumerStatefulWidget {
  const TokenListScreen({super.key});

  @override
  _TokenListScreenState createState() => _TokenListScreenState();
}

class _TokenListScreenState extends ConsumerState<TokenListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final token = TokenInstanceProvider(ref);
    final tokenNotifier = token.notifier;
    final theme = ref.watch(appThemeProvider);
     final selectedColor = theme == ThemeMode.dark
        ? Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({})
        : Colors.white;

    final selectColorLabel =
        theme == ThemeMode.dark ? Colors.white : Colors.black;
    final unselectColorLabel =
        theme == ThemeMode.dark ? Colors.grey : Colors.black;
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
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: token.selectedButtonIndex == index
                  ? selectedColor
                  : unselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // ความโค้งของขอบ
                side: BorderSide(
                    color: token.selectedButtonIndex == index
                        ? Colors.white
                        : Color.fromARGB(104, 255, 255, 255),
                    width: token.selectedButtonIndex == index
                        ? 1
                        : 0.8), // ขอบของปุ่ม
              ),
            ),
            onPressed: () {
              token.buttonNotifier.selectButton(index);
            },
            child: Text(
              label,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: token.selectedButtonIndex == index
                      ? FontWeight.w500
                      : FontWeight.w300,
                  color: token.selectedButtonIndex == index
                      ? selectColorLabel
                      : unselectColorLabel),
            )),
      );
    }

    return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Tokens",
          style: GoogleFonts.poppins(fontSize: 20),
        ),
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
          margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.0),
          TokenSearchBar(onChanged: (query) {
 
            tokenNotifier.autoSearch(query);
}),

              SizedBox(height: 20.0),
              Row(
                children: [
                  buildButton("All", 0),
                  buildButton("Ongoing", 1),
                  buildButton("Upcoming", 2),
                  buildButton("Finisned", 3)
                ],
              ),
              Expanded(
                  child: buidToken(
                      context, token.tokenData, token.selectedButtonIndex))
            ],
          ),
        ),
      ),
    );
  }
}
