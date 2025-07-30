import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versa_app_tutorial_cleanarch/features/authentication/presentation/providers/auth_provider.dart';
import 'package:versa_app_tutorial_cleanarch/features/setting/presentation/widget/setting/menu_options.dart';

class OtherSettings extends ConsumerWidget {
  final ThemeData theme;
  final AuthProviderInstance instance;
  const OtherSettings({super.key, required this.theme, required this.instance});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                        margin: EdgeInsets.symmetric(vertical:5,horizontal: 10),
              child: Text(
                "Others",
                style: GoogleFonts.poppins(
                    color: theme.primaryColor, fontSize: 14),
              )),
          MenuOption(
              label: "Sign Out",
              icon: FontAwesomeIcons.rightFromBracket,
              theme: theme,
              onPressed: () async {
                bool? shouldSignOut = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // กำหนดความโค้งมนของขอบ
                        side: BorderSide(
                          color: Theme.of(context).primaryColor.withAlpha(25), // สีขอบ
                          width: 1.0, // ความหนาของขอบ
                          
                        ),
                      ),
                      title: Text('ยืนยันการออกจากระบบ',
                          style: GoogleFonts.kanit(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor)),
                      content: Text('คุณต้องการออกจากระบบหรือไม่',
                          style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor)),
                      actions: <Widget>[
                        // ปุ่ม Cancel
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false); // ยกเลิก
                          },
                          child: Text('ยกเลิก',
                              style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor)),
                        ),
                        // ปุ่ม Confirm
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(true); // ยืนยันการออกจากระบบ
                          },
                          child: Text('ยืนยัน',
                              style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ],
                    );
                  },
                );

                // เช็คผลการยืนยันจาก Dialog
                if (shouldSignOut!) {
                  // ทำการ Sign out
                  await instance.notifier.signout(context);
                }
              }),
        ],
      ),
    );
  }
}
