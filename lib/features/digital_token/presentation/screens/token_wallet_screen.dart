import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_scaffold.dart';

class TokenWalletScreen extends ConsumerWidget {
  const TokenWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: AppBar(
          leadingWidth: 150,
          leading: Container(
            padding: const EdgeInsets.all(10.0), // ปรับขนาดให้เหมาะสม
            child: Text(
              'Versa Wallet', // ใส่ข้อความที่ต้องการที่นี่
              style: GoogleFonts.kanit(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.all(10.0), // ปรับขนาดให้เหมาะสม

                child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {}))
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to your token wallet!'),
          ],
        ),
      ),
       backgroundColor: Colors.transparent,
    );
  }
}
