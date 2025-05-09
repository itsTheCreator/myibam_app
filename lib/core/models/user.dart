class User {
  final String id;
  final String email;
  final String fullName;
  final String userType;
  
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.userType,
  });
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      userType: json['user_type'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'user_type': userType,
    };
  } }
