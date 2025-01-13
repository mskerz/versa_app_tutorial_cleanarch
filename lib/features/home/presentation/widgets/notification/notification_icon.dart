
import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int notificationCount;
  final VoidCallback onPressed;

  const NotificationBadge({
    Key? key,
    required this.notificationCount,
    required this.onPressed,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        clipBehavior: Clip.none, // Allow badge to overflow
        children: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: onPressed,
          ),
          // Badge at the top-right corner of the icon
          if (notificationCount > 0) // Only show the badge if there are notifications
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red, // Background color of the badge
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: 20, // Minimum width of the badge
                  minHeight: 20,
                ),
                child: Center(
                  child: Text(
                    '$notificationCount', // Display notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12, // Font size of the badge text
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
