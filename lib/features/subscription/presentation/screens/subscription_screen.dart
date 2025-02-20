import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/home/presentation/widgets/home/user_avatar.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';

import '../widgets/subscription_transaction.dart';
 

 class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen> {
  late UIInstanceProvider ui;
  late final theme;
  late final notifier;

  @override
  void initState() {
    super.initState();
    ui = UIInstanceProvider(ref);
    }

  @override
  Widget build(BuildContext context) {
    final auth = AuthProviderInstance(ref);
    return AppScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 120,
        leading: Center(
          child: Text(
            "My Orders",
            style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
         UserAvatar(userResponse:auth.user ,isVisibleName: false,)
           
        ],
      ),
      body: AppBodyWithGredient(

        content: OrderTransactionContainer(),
      ),
    );
  }
}
