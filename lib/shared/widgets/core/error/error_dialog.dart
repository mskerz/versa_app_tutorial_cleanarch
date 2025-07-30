import 'package:flutter/material.dart';

Future<void> showErrorDialog(
      BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // ป้องกันการปิด dialog ด้วยการคลิกข้างนอก
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
          ],
        ); // ใช้ ErrorDialog ที่สร้างขึ้น
      },
    );
  }