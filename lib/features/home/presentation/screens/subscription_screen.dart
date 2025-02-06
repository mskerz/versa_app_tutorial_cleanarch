import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, ref) { 

    return AppScaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
                title: Text(
          "Token Orders",
          style: GoogleFonts.kanit(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
