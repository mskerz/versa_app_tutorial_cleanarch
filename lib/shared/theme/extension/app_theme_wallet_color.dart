import 'package:flutter/material.dart';

class WalletColorExtension extends ThemeExtension<WalletColorExtension> {
  final Color? colorWalletItemButton;
  final Gradient? gradientWalletContainer;
  final Gradient? gradientWalletContainerBorder;

  const WalletColorExtension(
      {this.colorWalletItemButton,
      this.gradientWalletContainer,
      this.gradientWalletContainerBorder});

  @override
  ThemeExtension<WalletColorExtension> copyWith(
      {Color? colorWalletItemButton,
      Gradient? gradientWalletContainer,
      Gradient? gradientWalletContainerBorder}) {
    // การคัดลอก ThemeExtension และอัปเดตค่าที่ต้องการ
    return WalletColorExtension(
        colorWalletItemButton:  colorWalletItemButton ?? this.colorWalletItemButton,
        gradientWalletContainer:  gradientWalletContainer ?? this.gradientWalletContainer,
        gradientWalletContainerBorder: gradientWalletContainerBorder ??  this.gradientWalletContainerBorder);
  }

  @override
  WalletColorExtension lerp(WalletColorExtension? other, double t) {
    // การผสมค่าของ ThemeExtension ระหว่าง 2 ตัว
    if (other == null) return this;
    return WalletColorExtension(
      colorWalletItemButton:
          Color.lerp(colorWalletItemButton, other.colorWalletItemButton, t),
          gradientWalletContainerBorder: Gradient.lerp(gradientWalletContainerBorder, other.gradientWalletContainerBorder, t)
    );
  }

  @override
  String toString() {
    return 'WalletColorExtension(colorWalletItemButton: $colorWalletItemButton)';
  }
}
