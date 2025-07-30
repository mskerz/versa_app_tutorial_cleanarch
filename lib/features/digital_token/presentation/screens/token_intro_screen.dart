import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/token_modal.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/token/token_model.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_background.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';

@RoutePage()
class TokenIntroScreen extends ConsumerWidget {
  final Token tokenItem;
  TokenIntroScreen(this.tokenItem, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSoldOut = tokenItem.currentRaised == tokenItem.fundingGoal;
    bool isOpen = tokenItem.status == "ongoing";
    bool isComing = tokenItem.status == "upcoming";
    bool isClosed = tokenItem.status == "finished";
    String labelStatus =isOpen ?"เปิดจอง" : isComing ?"ใกล้เปิดจอง" : "ปิดจองแล้ว" ;
    Color colorStatus =isOpen? Colors.green :isComing? Colors.orange:Colors.blueGrey; 
     String amountStatus = isSoldOut ? 'ขายหมดแล้ว' : 'ยังเปิดจองอยู่';
    if (tokenItem == null) {
      return Container();
    }
    final gradient =
        Theme.of(context).extension<GradientBackgroundExtention>()?.gradientBackground;
    final appThemeNotifier = ref.read(appThemeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    return AppScaffold(
      isVisibleBottomBar: false,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // ไม่มีเงา
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  appThemeNotifier.toggleTheme();
                },
                icon: Icon(
                  theme == ThemeMode.dark
                      ? Icons.dark_mode // ถ้าธีมเป็น dark ให้ใช้ dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).primaryColor,
                )),
          )
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AppBodyWithGredient(
        content: Container(
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
                  style: GoogleFonts.kanit(fontSize: 25, color: Theme.of(context).primaryColor),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: colorStatus,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(labelStatus,style: GoogleFonts.prompt(fontSize: 12, color: Colors.white),),
                ),
                Spacer(), // This will push the ElevatedButton to the bottom
            
                // GestureDetector + ElevatedButton
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:
                              Theme.of(context).colorScheme.onPrimary.withAlpha(90)),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: IconButton(
                        color: Colors.black, // กำหนดสีที่ต้องการที่นี่
                        onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (context) =>
                                buildTokenModalSheet(tokenItem,context)),
                        icon: Icon(FontAwesomeIcons.arrowDown,
                            color: Theme.of(context)
                                .primaryColor // กำหนดสีที่ต้องการที่นี่
                            ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
