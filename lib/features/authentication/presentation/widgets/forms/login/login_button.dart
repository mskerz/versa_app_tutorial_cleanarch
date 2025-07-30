import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends ConsumerWidget {
  final void Function() onPressed;

  SignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {

          onPressed();
          
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).primaryColor,
          disabledBackgroundColor: Colors.grey,
        ),
        icon: Icon(Icons.login, color: Theme.of(context).scaffoldBackgroundColor),
        label: Text(
          'Sign In',
          style: GoogleFonts.poppins(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
