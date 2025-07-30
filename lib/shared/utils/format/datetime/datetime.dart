import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeTH {
  DateTimeTH() {
    initializeDateFormatting();
  }

  /// Format DateTime to Thai date with Buddhist Era (B.E.)
  String formatDate(DateTime date) {
    // เพิ่ม 543 ปี เพื่อเปลี่ยนเป็นปีพุทธศักราช
    int buddhistYear = (date.year + 543)%100;

    // จัดรูปแบบวันที่เป็น "วันที่ dd MMM yyyy"
    final formatter = DateFormat('d MMM ', 'th');
    return "${formatter.format(date)}$buddhistYear";
  }

  /// Parse and format a date string like "2024-07-15"
  String formatStringDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return formatDate(date);
  }

  String formatDateStartToEnd(String startDate,String endDate) {
       DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    // ใช้ DateFormat ในการจัดรูปแบบ
    final dateFormat = DateFormat('d MMM yy');
     // จัดรูปแบบวันที่
    String formattedStart = dateFormat.format(start);
    String formattedEnd = dateFormat.format(end);
    return "$formattedStart - $formattedEnd";
  }

  
}

final datetime = DateTimeTH();