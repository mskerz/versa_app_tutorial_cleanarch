import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingCard extends ConsumerWidget {
  final Widget? child;
  final ThemeData theme;
  const SettingCard({super.key, this.child, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
            elevation: 0, // เงาให้ดูเด่นขึ้น
surfaceTintColor: Colors.transparent,
            color: Color.fromARGB(74, 137, 137, 137),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: theme.primaryColor.withAlpha(23), // ใช้สีขาวพร้อม opacity 9%
                width: 1, // ความหนาของ border
              ),
            ),
            
            child: child,
            );
  }
}
