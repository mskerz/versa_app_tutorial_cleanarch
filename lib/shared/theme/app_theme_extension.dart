import 'package:flutter/material.dart';

class GradientBackgroundExtention extends ThemeExtension<GradientBackgroundExtention> {
  final Gradient? gradientBackground;
  final Gradient? gradientContainerPrimary;
  final Gradient? gradientContainerSecondary;
  final Gradient? gradientBottomBar;

  const GradientBackgroundExtention({this.gradientBackground,this.gradientContainerPrimary,this.gradientContainerSecondary,this.gradientBottomBar});

  @override
  GradientBackgroundExtention copyWith({Gradient? gradientBackground,Gradient? gradientContainerPrimary,Gradient? gradientContainerSecondary,Gradient? gradientBottomBar}) {
    return GradientBackgroundExtention(
      gradientBackground: gradientBackground ?? this.gradientBackground,
      gradientContainerPrimary: gradientContainerPrimary ?? this.gradientContainerPrimary,
      gradientContainerSecondary: gradientContainerSecondary ?? this.gradientContainerSecondary,
      gradientBottomBar: gradientBottomBar ?? this.gradientBottomBar
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
