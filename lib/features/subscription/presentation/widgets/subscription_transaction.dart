import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/subscription/presentation/providers/order_button_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/subscription/presentation/widgets/order/card.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';

class OrderTransactionContainer extends ConsumerWidget {
  const OrderTransactionContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonIndex = ref.watch(orderButtonProvider);
    final ButtonIndexNoitifier = ref.read(orderButtonProvider.notifier);
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
        
    Widget buildOrderButton(String label, int index) {
      return Container(
        width: 80,
        height: 32,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor:
                  buttonIndex == index ? selectedColor : unselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                    color: buttonIndex == index
                        ? Colors.white
                        : Color.fromARGB(104, 255, 255, 255),
                    width: buttonIndex == index ? 1 : 0.8),
              ),
            ),
            onPressed: () {
              ButtonIndexNoitifier.state = index;
            },
            child: Text(
              label,
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  height: 15/10,
                  fontWeight:
                      buttonIndex == index ? FontWeight.w500 : FontWeight.w300,
                  color: buttonIndex == index
                      ? selectColorLabel
                      : unselectColorLabel),
            )),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildOrderButton("All", 0),
              buildOrderButton("Completed", 1),
              buildOrderButton("Pending", 2),
              buildOrderButton("Canceled", 3),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(initialScrollOffset: 0),
              physics: AlwaysScrollableScrollPhysics(),
              child:Column(
                children: [
                OrderCard(
                    amount: 20,
                    tokenPrice: 100,
                    orderStatus: 0,
                    tokenName: "SC Morning Coin",
                    dateTime: '2 Jan 25 - 13:00',
                    tokenSymbol: "MNC"),
                OrderCard(
                    amount: 10,
                    tokenPrice: 100,
                    orderStatus: 1,
                    tokenName: "SC Morning Coin",
                    dateTime: '1 Jan 25 - 12:00',
                    tokenSymbol: "MNC")
              ],
              ),
            ),
          )
        ],
      ),
    );
  }
}