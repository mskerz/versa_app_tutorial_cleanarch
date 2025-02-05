import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingIconTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingIconTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title,style: GoogleFonts.prompt(color: Theme.of(context).primaryColor),),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
