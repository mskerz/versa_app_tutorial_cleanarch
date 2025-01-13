import 'package:flutter/material.dart';

class LeadingLogo extends StatelessWidget {
  final String logoAssetPath;
  final Function()? onMenuPressed;

  const LeadingLogo({
    Key? key,
    required this.logoAssetPath,
    this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize
          .min, // Prevent the row from taking up more space than needed
      children: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            if (onMenuPressed != null) {
              onMenuPressed!();
            }
          },
        ),
        SizedBox(width: 8),
        // Image is inside a ClipRect to prevent overflow
        Image.asset(
          logoAssetPath,
          height: 25,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
