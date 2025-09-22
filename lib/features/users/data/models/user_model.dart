import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String email,
    required String avatar,
    required String job, // Added job to constructor
  }) : super(id: id, name: name, email: email, avatar: avatar, job: job); // Pass job to super

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: (json['first_name'] ?? '') + ' ' + (json['last_name'] ?? ''),
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      job: json['job'] ?? '', // Provide default value for job
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': name.split(' ')[0],
      'last_name': name.split(' ').length > 1 ? name.split(' ').sublist(1).join(' ') : null,
      'email': email,
      'avatar': avatar,
      'job': job, // Add job to toJson
    };
  }
}