import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/routes/app_route.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/core/app/app_widget.dart';

@RoutePage()
class BlankTransitionPage extends ConsumerStatefulWidget {
  final void Function() onRedirect;
  const BlankTransitionPage({super.key, required this.onRedirect});

  @override
  _BlankTransitionPageState createState() => _BlankTransitionPageState();
}

class _BlankTransitionPageState extends ConsumerState<BlankTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 73, 73),
      body: AppBodyWithGredient(
        removeFixedPadding: true,
        content: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                 Icon(
                  Icons.lock_person,
                  color: Colors.black.withAlpha(100),
                  size: 80,
                ),
                                                            const SizedBox(width: 3.0),

                Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text( 
                      'Unauthorized !',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'You are not authorized to view this screen',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            foregroundColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            // ถ้าเลือก "ยกเลิก" ให้นำทางไปที่หน้า Home
                            context.router.replace(HomeRoute());
                          },
                          
                          child: Text(
                            'Go Back',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                                            const SizedBox(width: 20.0),

                        TextButton.icon(
                          icon: Icon(FontAwesomeIcons.rightToBracket,color: Theme.of(context).scaffoldBackgroundColor,),
                          
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          onPressed: () {
                            // ถ้าเลือก "เข้าสู่ระบบ" ให้เรียก onRedirect ที่ส่งเข้ามา
                            widget.onRedirect();
                          },
                          label: Text(
                            'Login',
                            style: GoogleFonts.poppins(fontSize: 16,),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
