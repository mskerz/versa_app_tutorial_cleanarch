import 'package:flutter/material.dart';

class GradientBackgroundExtention extends ThemeExtension<GradientBackgroundExtention> {
  final Gradient? gradientBackground;
  final Gradient? gradientContainerPrimary;
  final Gradient? gradientContainerSecondary;


  const GradientBackgroundExtention({this.gradientBackground,this.gradientContainerPrimary,this.gradientContainerSecondary});

  @override
  GradientBackgroundExtention copyWith({Gradient? gradientBackground,Gradient? gradientContainerPrimary,Gradient? gradientContainerSecondary}) {
    return GradientBackgroundExtention(
      gradientBackground: gradientBackground ?? this.gradientBackground,
      gradientContainerPrimary: gradientContainerPrimary ?? this.gradientContainerPrimary,
      gradientContainerSecondary: gradientContainerSecondary ?? this.gradientContainerSecondary
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
