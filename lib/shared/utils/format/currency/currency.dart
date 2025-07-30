import 'package:intl/intl.dart';

class FormatCurrency {
  final String locale;

  // Constructor เพื่อกำหนด locale ที่ใช้
  FormatCurrency({this.locale = 'en_US'});

  // ฟังก์ชันในการจัดรูปแบบเงิน
  String format(double amount) {
    // การใช้ toStringAsFixed(2) เพื่อจำกัดจำนวนทศนิยมเป็น 2 ตำแหน่ง
    final formattedAmount = amount.toStringAsFixed(2);
    // การใช้ NumberFormat เพื่อจัดรูปแบบสกุลเงิน
    final formatCurrency = NumberFormat.simpleCurrency(locale: locale);
    return formatCurrency.format(double.parse(formattedAmount));
  }
 
  String formatInt(int amount){
    return NumberFormat.decimalPattern(locale).format(amount);
  }
}

final format = FormatCurrency(locale: 'th_TH');
