import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/providers/token_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/wallet/own_token_card.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/app_theme.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_gradient_extension.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_wallet_color.dart';
import 'package:versa_app_tutorial_cleanarch/shared/utils/mockup.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/logo/versa.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

import 'token_wallet_button.dart';

class TokenWalletContainer extends ConsumerWidget {
  const TokenWalletContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = AuthProviderInstance(ref);
    final token = TokenInstanceProvider(ref);
    final button = TokenInstanceProvider(ref);
    final ui = UIInstanceProvider(ref);

    final themeMode = ref.watch(appThemeProvider);
    final theme = Theme.of(context);
    final walletAddressMockup =
        mockupAddress.generateWalletAddress("EXAMPLE_PRIVATE_KEY");
    final shortenAddress = mockupAddress.shortenAddress(walletAddressMockup);
    final selectedColor = themeMode == ThemeMode.dark
        ? Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({})
        : Colors.white;
    final unselectedColor = Theme.of(context)
        .elevatedButtonTheme
        .style
        ?.surfaceTintColor
        ?.resolve({});

    final gredient =
        Theme.of(context).extension<GradientBackgroundExtention>()!;
    final walletTheme = Theme.of(context).extension<WalletColorExtension>()!;
    Widget redirectToLogin() {
      Future.delayed(Duration(seconds: 2), () {
        context.router.replace(LoginRoute());
      });
      return CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
      );
    }

    void copyAddress() {
      Clipboard.setData(ClipboardData(text: walletAddressMockup));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16),
          backgroundColor: theme.primaryColor,
          content: const Text("Copied to clipboard!"),
        ),
      );
      Future.delayed(const Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
    }

    return Padding(
      // Use Padding instead of Container for margin
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Use minimum space needed
        children: [
          const SizedBox(height: 10),
          Container(
            height: 175, // Fixed height for the entire wallet card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: walletTheme.gradientWalletContainer,
              border: GradientBoxBorder(
                  gradient: walletTheme.gradientWalletContainerBorder ??
                      LinearGradient(colors: const [
                        Colors.transparent,
                        Colors.transparent
                      ])),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Available Balance",
                            style: GoogleFonts.poppins(
                                color: theme.primaryColor, fontSize: 14),
                          ),
                          imageVersaLogo(themeMode)
                        ],
                      ),
                      Text(
                        "####.##", // $2000.00
                        style: GoogleFonts.poppins(
                            fontSize: 36,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      
                      gradient: LinearGradient(
                        
                          colors: [
                            Color(0x2FFFFFFF),
                            Color.fromARGB(44, 255, 255, 255),
                          ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            shortenAddress,
                            style: GoogleFonts.poppins(
                                color: theme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                iconColor: theme.primaryColor),
                            onPressed: copyAddress,
                            icon: const Icon(Icons.copy),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TokenWalletListButton(),
                    const SizedBox(height: 30),

          Text(
            "Your Tokens",
            style: GoogleFonts.poppins(
                fontSize: 18,
                color: theme.primaryColor,
                fontWeight: FontWeight.w500),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TokenWalletItemCard(
                amount: 2000,
                tokenName: "AEGIS Tech Token",
                tokenSymbol: 'AGIS',
              ),
              TokenWalletItemCard(
                amount: 1500,
                tokenName: "Pruksa Token",
                tokenSymbol: 'PRUSKA',
              )
            ],
          )
        ],
      ),
    );
  }
}
