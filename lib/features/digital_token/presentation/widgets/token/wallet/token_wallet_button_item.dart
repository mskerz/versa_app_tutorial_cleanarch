import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/theme/extension/app_theme_wallet_color.dart';

class TokenWalletButton extends ConsumerWidget {
  final String? label;
  final Widget? icon;
  final void Function()? onPressed;

  TokenWalletButton({this.label, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletThemeButton = Theme.of(context).extension<WalletColorExtension>()!;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: walletThemeButton.colorWalletItemButton),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // ให้ Row ไม่ขยายเกินขนาด
        children: [
          icon!,
          SizedBox(width: 5), // เว้นระยะระหว่าง icon และข้อความ
          Text(
            label!,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5, // line-height คำนวณจาก font size (14px * 1.5 = 21px)
              letterSpacing: 0, // กำหนด spacing ระหว่างตัวอักษร
            ),
          ),
        ],
      ),
    );
  }
}
