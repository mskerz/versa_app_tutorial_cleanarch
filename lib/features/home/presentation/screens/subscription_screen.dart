import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, ref) { 

    return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
                elevation: 1,
                        backgroundColor:Colors.transparent,

        surfaceTintColor: Colors.transparent,leadingWidth: 120,
                leading: Center(
                
                  child: Text(
                            "My Orders",
                            style: GoogleFonts.poppins(color: Theme.of(context).primaryColor,fontSize: 20),
                          ),
                ),
      ),
      body:AppBodyWithGredient(
        content: Container(),
      ) ,
    );
  }
}
