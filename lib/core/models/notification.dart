class AppNotification {
  final String id;
  final String userId;
  final String title;
  final String message;
  final String type;
  final bool read;
  final DateTime createdAt;
  
  AppNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.read,
    required this.createdAt,
  });
  
  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      message: json['message'],
      type: json['type'],
      read: json['read'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'message': message,
      'type': type,
      'read': read,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
