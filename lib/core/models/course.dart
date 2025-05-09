class Course {
  final String? id;
  final String title;
  final String teacherId;
  final String room;
  final DateTime startTime;
  final DateTime endTime;
  
  Course({
    this.id,
    required this.title,
    required this.teacherId,
    required this.room,
    required this.startTime,
    required this.endTime,
  });
  
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      teacherId: json['teacher_id'],
      room: json['room'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
    );
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'teacher_id': teacherId,
      'room': room,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
    };
    
    if (id != null) {
      data['id'] = id;
    }
    
    return data;
  }
}
