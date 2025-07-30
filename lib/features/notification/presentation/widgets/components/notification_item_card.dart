import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/shared/domain/models/notify/notify_model.dart';

class NotificationItemCard extends StatelessWidget {
  final Function(int) onMarkAsRead;
  final Function(String) onDelete;

  final Notify item;
  final int index;

  const NotificationItemCard(
      {super.key,
      required this.onMarkAsRead,
      required this.onDelete,
      required this.item,
      
      required this.index,
     });

  @override

  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          onMarkAsRead(index);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(30),
            border: Border.all(color: Colors.white.withAlpha(23)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: item.isRead
                    ? Theme.of(context).colorScheme.onSurface
                    : Colors.red,
              ),
              child: Text(
                item.isRead ? "Read" : "New",
                style: GoogleFonts.prompt(color: Colors.white),
              ),
            ),
            title: Text(
              item.title,
              style: GoogleFonts.kanit(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            subtitle: Text(
              item.content,
              style: GoogleFonts.prompt(
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: Row(
              mainAxisSize:
                  MainAxisSize.min, // ลดขนาด Column ให้เล็กที่สุดที่จำเป็น
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.trashCan),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    onDelete(item.messageId);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
