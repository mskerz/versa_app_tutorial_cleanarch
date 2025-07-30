import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:versa_app_tutorial_cleanarch/features/digital_token/presentation/widgets/token/wallet/token_wallet_button_item.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/icon/svg_icon.dart';

class TokenWalletListButton extends ConsumerWidget {
  const TokenWalletListButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TokenWalletButton(
          label: "Transfer",
          icon: SVGIcons.transfer(Theme.of(context).primaryColor),
          onPressed: () {},
        ),
        TokenWalletButton(
          label: "History",
          icon: Icon(
            FontAwesomeIcons.clock,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        TokenWalletButton(
          label: "Buy",
          icon: SVGIcons.buy(Theme.of(context).primaryColor),
          onPressed: () {},
        ),
      ],
    );
  }
}
