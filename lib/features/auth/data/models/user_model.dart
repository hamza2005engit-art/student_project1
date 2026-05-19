import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.email, super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // إذا كانت البيانات مغلفة بكلمة 'user' نأخذ ما بداخلها، وإلا نأخذ الـ json نفسه
    final userData = json.containsKey('user') ? json['user'] : json;

    return UserModel(
      // تحويل آمن للـ id ليقبل int أو String
      id: userData['id'] is int
          ? userData['id']
          : int.parse(userData['id']?.toString() ?? '0'),
      name: userData['full_name'] ?? userData['name'] ?? '',
      email: userData['email'] ?? '',
      token: json['token'] ?? '',
    );
  }

}