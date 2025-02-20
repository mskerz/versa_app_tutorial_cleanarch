import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
          ),
          Text(
            " or ",
            style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
