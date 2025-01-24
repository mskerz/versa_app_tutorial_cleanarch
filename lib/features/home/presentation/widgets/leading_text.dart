import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadingText extends StatelessWidget {
  final String label;
  final Function()? onMenuPressed;

  const LeadingText({
    Key? key,
    required this.label,
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
        Text(label,style: GoogleFonts.kanit(color: Colors.white),)
      ],
    );
  }
}
