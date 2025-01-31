import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/bottom_navbar_bar.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, ref) { 

    return Scaffold(
      appBar: AppBar(
                title: Text(
          "Subscription",
          style: GoogleFonts.kanit(color: Theme.of(context).primaryColor),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
