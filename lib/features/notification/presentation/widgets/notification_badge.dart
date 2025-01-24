import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';

class NotificationBadge extends StatelessWidget {
  final int notificationCount;

  const NotificationBadge({
    Key? key,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: IconButton(
        
        icon: Stack(
          children: [
            Icon(
              Icons.notifications,
              size: 30.0,
              color: Theme.of(context).primaryColor,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 0,
                top: 0,
                left: 15,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    notificationCount.toString(),
                    style: GoogleFonts.kanit(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
        onPressed: (){
            AutoRouter.of(context).push(NotificationRoute());

        },
      ),
    );
  }
}
