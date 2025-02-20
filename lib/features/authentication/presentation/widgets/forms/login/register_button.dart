import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  final void Function() onPressed;
  SignUpButton({super.key, required this.onPressed});
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Theme.of(context).colorScheme.primary,
            disabledBackgroundColor: Colors.grey,
          ),
          label: Text(
            "Sign Up",
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.secondary),
          ),
          icon: Icon(Icons.create,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
