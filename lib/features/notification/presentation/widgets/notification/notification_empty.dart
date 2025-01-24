import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Center(
        child: Text(
          "No notifications at this time.",
          style: GoogleFonts.prompt(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
