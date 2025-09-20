import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String email,
    required String avatar,
  }) : super(id: id, name: name, email: email, avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['first_name'] + ' ' + (json['last_name'] ?? ''),
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': name.split(' ').first,
      'last_name': name.split(' ').length > 1 ? name.split(' ')[1] : '',
      'email': email,
      'avatar': avatar,
    };
  }
}
