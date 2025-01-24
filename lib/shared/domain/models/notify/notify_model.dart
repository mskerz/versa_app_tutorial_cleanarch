import 'package:equatable/equatable.dart';

class Notify extends Equatable {
  final String messageId;
  final String title;
  final String content;
  final bool isRead;
  final String type;
  final DateTime createdAt;
  final NotifyInfo info;

  // Constructor
  Notify({
    required this.messageId,
    required this.title,
    required this.content,
    required this.isRead,
    required this.type,
    required this.createdAt,
    required this.info,
  });

  // การแปลง JSON เป็น Notify
  factory Notify.fromJson(Map<String, dynamic> json) {
    return Notify(
      messageId: json['messageId'],
      title: json['title'],
      content: json['content'],
      isRead: json['isRead'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']),
      info: NotifyInfo.fromJson(json['info']),
    );
  }

  // การแปลง Notify เป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'title': title,
      'content': content,
      'isRead': isRead,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'info': info.toJson(),
    };
  }
// copyWith method สำหรับการอัปเดตค่าสมาชิก
  Notify copyWith({
    String? messageId,
    String? title,
    String? content,
    bool? isRead,
    String? type,
    DateTime? createdAt,
    NotifyInfo? info,
  }) {
    return Notify(
      messageId: messageId ?? this.messageId,
      title: title ?? this.title,
      content: content ?? this.content,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      info: info ?? this.info,
    );
  }

  @override
  List<Object?> get props => [messageId, title, content, isRead, type, createdAt, info];
}

class NotifyInfo extends Equatable {
  final String symbol;

  // Constructor
  NotifyInfo({required this.symbol});

  // การแปลง JSON เป็น NotifyInfo
  factory NotifyInfo.fromJson(Map<String, dynamic> json) {
    return NotifyInfo(symbol: json['symbol']);
  }

  // การแปลง NotifyInfo เป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }


  @override
  List<Object?> get props => [symbol];
}
