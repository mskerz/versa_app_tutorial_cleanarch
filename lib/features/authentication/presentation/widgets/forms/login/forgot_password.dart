import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              print("Forget Password Button");
            },
            child: Text(
              "Forget Password ?",
              style: GoogleFonts.poppins(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
