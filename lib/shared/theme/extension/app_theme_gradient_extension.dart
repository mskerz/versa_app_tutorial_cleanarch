import 'package:flutter/material.dart';

class GradientBackgroundExtention extends ThemeExtension<GradientBackgroundExtention> {
  final Gradient? gradientBackground;
  final Gradient? gradientContainerPrimary;
  final Gradient? gradientContainerSecondary;
  final Gradient? gradientBottomBar;
  final Gradient? gradientFloatingButton;
  final Gradient? gradientFloatingButtonBorder;
  final Gradient? gradientBlackgroundIcon;
  const GradientBackgroundExtention({this.gradientBackground,this.gradientContainerPrimary,this.gradientContainerSecondary,this.gradientBottomBar,this.gradientFloatingButton,this.gradientFloatingButtonBorder,this.gradientBlackgroundIcon});

  @override
  GradientBackgroundExtention copyWith({Gradient? gradientBackground,Gradient? gradientContainerPrimary,Gradient? gradientContainerSecondary,Gradient? gradientBottomBar,Gradient? gradientFloatingButton,Gradient? gradientFloatingButtonBorder,Gradient? gradientBlackgroundIcon}) {
    return GradientBackgroundExtention(
      gradientBackground: gradientBackground ?? this.gradientBackground,
      gradientContainerPrimary: gradientContainerPrimary ?? this.gradientContainerPrimary,
      gradientContainerSecondary: gradientContainerSecondary ?? this.gradientContainerSecondary,
      gradientBottomBar: gradientBottomBar ?? this.gradientBottomBar,
      gradientFloatingButton:  gradientFloatingButton ?? this.gradientFloatingButton,
      gradientFloatingButtonBorder: gradientFloatingButtonBorder?? this.gradientFloatingButtonBorder,
      gradientBlackgroundIcon:  gradientBlackgroundIcon ?? this.gradientBlackgroundIcon
    );
  }

  @override
  GradientBackgroundExtention lerp(GradientBackgroundExtention? other, double t) {
    if (other == null) return this;
    return GradientBackgroundExtention(
      gradientBackground:
          Gradient.lerp(gradientBackground, other.gradientBackground, t),
    );
  }
}
